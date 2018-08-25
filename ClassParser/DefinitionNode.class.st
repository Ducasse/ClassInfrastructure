Class {
	#name : #DefinitionNode,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name'
	],
	#category : #ClassParser
}

{ #category : #accessing }
DefinitionNode >> name [
	^ name 
]

{ #category : #accessing }
DefinitionNode >> name: aString [ 
	name := aString
]

{ #category : #accessing }
DefinitionNode >> parent [

	^ parent
]

{ #category : #accessing }
DefinitionNode >> parent: aNode [

	parent := aNode
]
