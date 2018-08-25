Class {
	#name : #CDClassParser,
	#superclass : #Object,
	#instVars : [
		'classDefinition',
		'subclass'
	],
	#category : #ClassParser
}

{ #category : #parsing }
CDClassParser class >> parse: aString [ 
	
	^ self new parse: aString
]

{ #category : #accessing }
CDClassParser >> className: aNode [ 
	
	classDefinition classNameNode: aNode astNode: aNode
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

{ #category : #initialization }
CDClassParser >> initialize [

	super initialize.
	classDefinition := CDClassDefinition new
]

{ #category : #accessing }
CDClassParser >> instanceVariablesString: aNode [
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

{ #category : #accessing }
CDClassParser >> package: aNode [ 
	
	classDefinition packageNameNode: aNode astNode: aNode
]

{ #category : #parsing }
CDClassParser >> parse: aString [ 
	
	| expressionTree |
	expressionTree := RBParser parseExpression: aString.
	classDefinition definitionExpressionTree: expressionTree.
	expressionTree acceptVisitor: self.
	^ classDefinition
]

{ #category : #parsing }
CDClassParser >> parseSelectorPart: aString withArgument: aNode [ 
	
	"We could do this with reflection, or with a dictionary and closures.
	I chose to use a series of if for readability only."
	
	aString = #subclass:
		ifTrue: [ ^ self className: aNode ].
	aString =	 #instanceVariableNames:
		ifTrue: [ ^ self instanceVariablesString: aNode ].
	aString =	 #slots:
		ifTrue: [ ^ self parseSlotsNodesFromArrayNode: aNode ].
	aString =	 #classVariableNames:
		ifTrue: [ ^ self classVariableNames: aNode ].
	aString =	 #package:
		ifTrue: [ ^ self package: aNode ].
	aString =	 #uses:
		ifTrue: [ ^ self parseTraitDefinitionFromNode: aNode ].
	
	self halt.
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

{ #category : #accessing }
CDClassParser >> parseTraitDefinitionFromNode: aNode [
	
	classDefinition addChild: (CDTraitComposition new
		originalNode: aNode;
		yourself)
]

{ #category : #accessing }
CDClassParser >> superclass: aSuperclassNode [

	classDefinition superclassNameNode: aSuperclassNode astNode: aSuperclassNode
]

{ #category : #visiting }
CDClassParser >> visitMessageNode: aRBMessageNode [
	
	self superclass: aRBMessageNode receiver.
	
	aRBMessageNode selectorParts
		with: aRBMessageNode arguments
		do: [ :selectorPart :argument |
			self parseSelectorPart: selectorPart withArgument: argument ]
]
