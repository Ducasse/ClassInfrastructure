Class {
	#name : #CDClassDefinitionNode,
	#superclass : #CDBehaviorDefinitionNode,
	#instVars : [
		'subclass',
		'sharedSlotNodes',
		'superclassNameNode',
		'packageNameNode',
		'sharedPools'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDClassDefinitionNode class >> on: aRBMessageNode [ 
	
	^ self new
		originalNode: aRBMessageNode;
		yourself
]

{ #category : #accessing }
CDClassDefinitionNode >> packageName [
	
	^ packageNameNode value asSymbol 
]

{ #category : #accessing }
CDClassDefinitionNode >> packageNameNode [
	
	^ packageNameNode
]

{ #category : #accessing }
CDClassDefinitionNode >> packageNameNode: aNode astNode: astNode [

	packageNameNode := aNode.
	children add: aNode.
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedPools: aCollection [ 
	sharedPools := aCollection.
	children addAll: aCollection
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlotNodes [
	
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlots [
	
	sharedSlotNodes ifNil: [ 
		sharedSlotNodes := definitionExpressionTree arguments third value substrings collect: [ :each | each asClassVariable ] ].
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlots: aCollection [ 
	sharedSlotNodes := aCollection.
	children addAll: aCollection
]

{ #category : #suggestions }
CDClassDefinitionNode >> specialCommands [
	
	^ SugsSuggestionFactory commandsForClass
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassName [
	
	^ superclassNameNode name asSymbol
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassNameNode [
	
	^ superclassNameNode
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassNameNode: aNode astNode: astNode [
	
	superclassNameNode := aNode.
	children add: aNode.
]
