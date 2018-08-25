Class {
	#name : #CDClassDefinition,
	#superclass : #Object,
	#instVars : [
		'definitionExpressionTree',
		'subclass',
		'traitDefinition',
		'classNameNode',
		'sharedSlotNodes',
		'slotNodes',
		'superclassNameNode',
		'packageNameNode',
		'classDefinitionNodes'
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
CDClassDefinition >> bestNodeFor: aSelection [
	
	| originalNodeSelected selectedClassDefinitionNode |
	originalNodeSelected := definitionExpressionTree bestNodeFor: aSelection.
	selectedClassDefinitionNode := classDefinitionNodes at: originalNodeSelected.
	^ selectedClassDefinitionNode
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
CDClassDefinition >> classNameNode: aNode [

	classNameNode := aNode
]

{ #category : #accessing }
CDClassDefinition >> classNameNode: aNode astNode: astNode [

	classNameNode := aNode.
	classDefinitionNodes at: astNode put: aNode
]

{ #category : #accessing }
CDClassDefinition >> definitionExpressionTree [
	^ definitionExpressionTree
]

{ #category : #accessing }
CDClassDefinition >> definitionExpressionTree: aRBMessageNode [ 
	definitionExpressionTree := aRBMessageNode
]

{ #category : #selection }
CDClassDefinition >> initialize [
	super initialize.
	classDefinitionNodes := Dictionary new.
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
	slotNodes := aCollection
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
	classDefinitionNodes at: astNode put: aNode
]

{ #category : #accessing }
CDClassDefinition >> traitDefinition: aNode [

	traitDefinition := aNode 
]
