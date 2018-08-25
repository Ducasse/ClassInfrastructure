Class {
	#name : #CDBehaviorDefinitionNode,
	#superclass : #CDNode,
	#instVars : [
		'classNameNode',
		'slotNodes',
		'traitDefinition',
		'className'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDBehaviorDefinitionNode >> addSlot: aCDSlotNode [
	
	slotNodes add: aCDSlotNode.
	children add: aCDSlotNode
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> className [

	^ className
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> className: aName astNode: astNode [

	className := aName.
	classNameNode := astNode.
	children add: astNode
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> classNameNode [
	
	^ classNameNode
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> classNameNode: aNode astNode: astNode [

	classNameNode := aNode.
	children add: aNode
]

{ #category : #'initialize-release' }
CDBehaviorDefinitionNode >> initialize [
	super initialize.
	slotNodes := OrderedCollection new
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> slotNodes [
	
	^ slotNodes
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> slots [

	^ slotNodes
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> slots: aCollection [ 
	
	slotNodes := aCollection.
	children addAll: aCollection
	
]

{ #category : #accessing }
CDBehaviorDefinitionNode >> traitDefinition: aNode [

	traitDefinition := aNode.
	children add: aNode.
]
