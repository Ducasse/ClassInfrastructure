Class {
	#name : #ClassDefinitionNode,
	#superclass : #DefinitionNode,
	#instVars : [
		'packageNode',
		'instanceVariableNodes',
		'classVariableNodes',
		'kind',
		'superclassName',
		'selector'
	],
	#category : #ClassParser
}

{ #category : #accessing }
ClassDefinitionNode >> superclassName [
	^ superclassName
]

{ #category : #accessing }
ClassDefinitionNode >> superclassName: aString [ 
	superclassName := aString
]
