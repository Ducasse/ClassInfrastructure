Class {
	#name : #ClassDefinitionNode,
	#superclass : #DefinitionNode,
	#instVars : [
		'packageNode',
		'instanceVariableNodes',
		'classVariableNodes',
		'kind',
		'superclassName',
		'selectorParts'
	],
	#category : #ClassParser
}

{ #category : #accessing }
ClassDefinitionNode >> package [
	^ packageNode
]

{ #category : #accessing }
ClassDefinitionNode >> package: aPackageDefinitionNode [ 
	packageNode := aPackageDefinitionNode
]

{ #category : #accessing }
ClassDefinitionNode >> packageName [
	^ packageNode name
]

{ #category : #accessing }
ClassDefinitionNode >> selectorParts [

	^ selectorParts
]

{ #category : #accessing }
ClassDefinitionNode >> selectorParts: aCollection [

	selectorParts := aCollection
]

{ #category : #accessing }
ClassDefinitionNode >> superclassName [
	^ superclassName
]

{ #category : #accessing }
ClassDefinitionNode >> superclassName: aString [ 
	superclassName := aString
]
