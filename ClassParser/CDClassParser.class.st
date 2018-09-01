"
ClassParser uses the default node representation of classes to parse class definition and 
return a dedicated class tree. 

The basic idea behing ClassParser is to reuse as much as possible as the current infrastructure
and not to reimplement yet another parser. 

Main public API is 
	- parse: aString
"
Class {
	#name : #CDClassParser,
	#superclass : #Object,
	#instVars : [
		'classDefinition',
		'subclass'
	],
	#category : #'ClassParser-Model'
}

{ #category : #parsing }
CDClassParser class >> fromASTNode: aNode [ 
	
	^ self new parseRootNode: aNode
]

{ #category : #parsing }
CDClassParser class >> parse: aString [ 
	
	^ self new parse: aString
]

{ #category : #internal }
CDClassParser >> beClassDefinition [
		
	classDefinition := CDClassDefinitionNode new
]

{ #category : #internal }
CDClassParser >> beMetaclassDefinition [
		
	classDefinition := CDMetaclassDefinitionNode new
]

{ #category : #accessing }
CDClassParser >> classVariableNames: aNode [ 
	
	| slots slotNodes classVariablesString |
	classVariablesString := aNode value.
	slots := classVariablesString substrings.
	slotNodes := slots
		collect: [ :slotName | | start |
			start := aNode start + (classVariablesString findString: slotName).
			CDSharedSlotNode
				node: aNode
				name: slotName
				typeName: 'ClassVariableSlot'
				start: start
				stop: start + slotName size ].
	classDefinition sharedSlots: slotNodes
]

{ #category : #testing }
CDClassParser >> isInstanceSideDefinition: aRBMessageNode [
	"Based on the Point or Point class structure, returns whether the definition is a class or instance side definition."
	^ aRBMessageNode receiver isMessage not
]

{ #category : #accessing }
CDClassParser >> package: aNode [ 
	
	classDefinition packageNameNode: aNode astNode: aNode
]

{ #category : #'parsing main' }
CDClassParser >> parse: aString [ 
	
	| expressionTree |
	expressionTree := RBParser parseExpression: aString.
	expressionTree doSemanticAnalysis.
	
	^ self parseRootNode: expressionTree
]

{ #category : #parsing }
CDClassParser >> parseClassName: aNode [ 
	
	| className superclassNode |
	className := (aNode isVariable
		ifTrue: [ aNode name ]
		ifFalse: [ aNode value ]) asSymbol.
		
	superclassNode := CDClassNameNode new
		originalNode: aNode;
		className: className. 
		
	classDefinition className: className astNode: superclassNode
]

{ #category : #parsing }
CDClassParser >> parseClassName: aNode withType: aSymbol [
	
	self parseClassName: aNode.
	classDefinition classKind: aSymbol
]

{ #category : #parsing }
CDClassParser >> parseInstanceVariablesFromNode: aNode [
	| slots slotNodes instanceVariablesString |
	instanceVariablesString := aNode value.
	slots := instanceVariablesString substrings.
	slotNodes := slots
		collect: [ :slotName | | start |
			start := aNode start + (instanceVariablesString findString: slotName).
			CDSlotNode
				node: aNode
				name: slotName
				typeName: 'InstanceVariableSlot'
				start: start
				stop: start + slotName size ].
	classDefinition slots: slotNodes
]

{ #category : #parsing }
CDClassParser >> parsePoolDictionariesFromNode: aNode [
	| shareds sharedPoolNodes sharedPoolString |
	sharedPoolString := aNode value.
	shareds := sharedPoolString substrings.
	sharedPoolNodes := shareds
		collect: [ :slotName | | start |
			start := aNode start + (sharedPoolString findString: slotName).
			CDSharedPoolNode
				node: aNode
				name: slotName
				start: start
				stop: start + slotName size ].
	classDefinition sharedPools: sharedPoolNodes
]

{ #category : #parsing }
CDClassParser >> parseRootNode: expressionTree [
	self setAdequateClassDefinitionFrom: expressionTree.
	classDefinition originalNode: expressionTree.
	expressionTree acceptVisitor: self.
	"why do we need this double dispatch?"
	^ classDefinition
]

{ #category : #parsing }
CDClassParser >> parseSelectorPart: aString withArgument: aNode [ 
	
	"We could do this with reflection, or with a dictionary and closures.
	I chose to use a series of if for readability only."
	
	(#(variableWordSubclass: ephemeronSubclass: weakSubclass: variableByteSubclass: variableSubclass: immediateSubclass: #subclass:) includes: aString)
		ifTrue: [ ^ self parseClassName: aNode withType: aString  ].
	aString =	 #instanceVariableNames:
		ifTrue: [ ^ self parseInstanceVariablesFromNode: aNode ].
	aString =	 #slots:
		ifTrue: [ ^ self parseSlotsNodesFromArrayNode: aNode ].
	aString =	 #classVariableNames:
		ifTrue: [ ^ self classVariableNames: aNode ].
	aString =	 #category:
		ifTrue: [ ^ self package: aNode ].	
	aString =	 #package:
		ifTrue: [ ^ self package: aNode ].
	aString =	 #uses:
		ifTrue: [ ^ self parseTraitDefinitionFromNode: aNode ].
	aString =	 #poolDictionaries:
		ifTrue: [ ^ self parsePoolDictionariesFromNode: aNode ].
	
	CDUnrecognizedClassPart new
		classDefinition: self; 
		unrecognizedPart: aString;
		signal
]

{ #category : #parsing }
CDClassParser >> parseSlotNode: aRBMessageNode [
	
	aRBMessageNode selector = '=>' ifTrue: [ | slot |
		slot := CDSlotNode
			node: aRBMessageNode
			name: aRBMessageNode receiver value
			typeName: aRBMessageNode arguments first name
			start: aRBMessageNode start
			stop: aRBMessageNode stop.
		classDefinition addSlot: slot.
		^ self
	].

	"If we are here we did not recognize the slot syntax"
	self halt.
]

{ #category : #parsing }
CDClassParser >> parseSlotsNodesFromArrayNode: aRBArrayNode [
	
	aRBArrayNode statements do: [ :slotStatement |
		self parseSlotNode: slotStatement ]
]

{ #category : #parsing }
CDClassParser >> parseSuperclassNode: aSuperclassNode [

	| aSuperclassName superclassNode |
	
	aSuperclassName := (aSuperclassNode isLiteralNode
		ifTrue: [ aSuperclassNode value asString ]
		ifFalse: [ aSuperclassNode name ]) asSymbol.
	
	superclassNode := CDClassNameNode new
		originalNode: aSuperclassNode;
		className: aSuperclassName. 

	classDefinition superclassName: aSuperclassName astNode: superclassNode
]

{ #category : #parsing }
CDClassParser >> parseTraitDefinitionFromNode: aNode [
	
	| traitComposition |
	traitComposition := CDTraitCompositionBuilder new
		buildFrom: aNode.	
	classDefinition addChild: traitComposition.
]

{ #category : #internal }
CDClassParser >> setAdequateClassDefinitionFrom: expressionTree [
	"set a class or metaclass class definition as class definition object."
	(self isInstanceSideDefinition: expressionTree)
		ifTrue: [ self beClassDefinition ]
		ifFalse: [ self beMetaclassDefinition ]
]

{ #category : #parsing }
CDClassParser >> visitMessageNode: aRBMessageNode [

	(self isInstanceSideDefinition: aRBMessageNode)
		ifTrue: [ "instance "
			self parseSuperclassNode: aRBMessageNode receiver.
			 ]
		ifFalse: [ "metaclass" 
			self parseClassName: aRBMessageNode receiver receiver
			].
	
	
	aRBMessageNode selectorParts
		with: aRBMessageNode arguments
		do: [ :selectorPart :argument |
			self parseSelectorPart: selectorPart withArgument: argument ]
]
