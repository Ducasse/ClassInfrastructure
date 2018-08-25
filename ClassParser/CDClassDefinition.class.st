Class {
	#name : #CDClassDefinition,
	#superclass : #CDNode,
	#instVars : [
		'definitionExpressionTree',
		'subclass',
		'traitDefinition',
		'classNameNode',
		'sharedSlotNodes',
		'slotNodes',
		'superclassNameNode',
		'packageNameNode',
		'classDefinitionNodes',
		'children'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDClassDefinition class >> on: aRBMessageNode [ 
	
	^ self new
		definitionExpressionTree: aRBMessageNode;
		yourself
]

{ #category : #selection }
CDClassDefinition >> bestNodeFor: anInterval [ 
	| selectedChildren |
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	selectedChildren := self children 
				select: [:each | each intersectsInterval: anInterval].
	^selectedChildren size == 1 
		ifTrue: [selectedChildren first bestNodeFor: anInterval]
		ifFalse: [self]
]

{ #category : #selection }
CDClassDefinition >> bestNodeForOld: aSelection [
	
	| originalNodeSelected selectedClassDefinitionNode |
	originalNodeSelected := definitionExpressionTree bestNodeFor: aSelection.
	selectedClassDefinitionNode := classDefinitionNodes at: originalNodeSelected.
	^ selectedClassDefinitionNode
]

{ #category : #selection }
CDClassDefinition >> children [

	^ children
]

{ #category : #introspection }
CDClassDefinition >> className [

	^ classNameNode value asSymbol
]

{ #category : #accessing }
CDClassDefinition >> classNameNode [
	
	^ classNameNode
]

{ #category : #accessing }
CDClassDefinition >> classNameNode: aNode astNode: astNode [

	classNameNode := aNode.
	children add: aNode.
	classDefinitionNodes at: astNode put: aNode.
]

{ #category : #selection }
CDClassDefinition >> containedBy: anInterval [ 
	^anInterval first <= self start and: [anInterval last >= self stop]
]

{ #category : #accessing }
CDClassDefinition >> definitionExpressionTree [
	^ definitionExpressionTree
]

{ #category : #accessing }
CDClassDefinition >> definitionExpressionTree: aRBMessageNode [ 
	definitionExpressionTree := aRBMessageNode
]

{ #category : #'initialize-release' }
CDClassDefinition >> initialize [
	super initialize.
	children := OrderedCollection new.
	classDefinitionNodes := Dictionary new.
]

{ #category : #selection }
CDClassDefinition >> intersectsInterval: anInterval [ 
	^(anInterval first between: self start and: self stop) 
		or: [self start between: anInterval first and: anInterval last]
]

{ #category : #accessing }
CDClassDefinition >> packageName [
	
	^ packageNameNode value asSymbol 
]

{ #category : #accessing }
CDClassDefinition >> packageNameNode [
	
	^ packageNameNode
]

{ #category : #accessing }
CDClassDefinition >> packageNameNode: aNode astNode: astNode [

	packageNameNode := aNode.
	children add: aNode.
	classDefinitionNodes at: astNode put: aNode
]

{ #category : #accessing }
CDClassDefinition >> sharedSlotNodes [
	
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinition >> sharedSlots [
	
	sharedSlotNodes ifNil: [ 
		sharedSlotNodes := definitionExpressionTree arguments third value substrings collect: [ :each | each asClassVariable ] ].
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinition >> sharedSlots: aCollection [ 
	sharedSlotNodes := aCollection
]

{ #category : #accessing }
CDClassDefinition >> slotNodes [
	
	^ slotNodes
]

{ #category : #accessing }
CDClassDefinition >> slots [

	slotNodes ifNil: [ 
		slotNodes := definitionExpressionTree arguments second value asSlotCollection ].
	^ slotNodes
]

{ #category : #accessing }
CDClassDefinition >> slots: aCollection [ 
	
	slotNodes := aCollection.
	children addAll: aCollection
	
]

{ #category : #selection }
CDClassDefinition >> start [
	
	^ definitionExpressionTree start
]

{ #category : #selection }
CDClassDefinition >> stop [
	
	^ definitionExpressionTree stop
]

{ #category : #accessing }
CDClassDefinition >> superclassName [
	
	^ superclassNameNode name asSymbol
]

{ #category : #accessing }
CDClassDefinition >> superclassNameNode [
	
	^ superclassNameNode
]

{ #category : #accessing }
CDClassDefinition >> superclassNameNode: aNode astNode: astNode [
	
	superclassNameNode := aNode.
	children add: aNode.
	classDefinitionNodes at: astNode put: aNode
]

{ #category : #accessing }
CDClassDefinition >> traitDefinition: aNode [

	traitDefinition := aNode 
]
