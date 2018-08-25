Class {
	#name : #CDTraitNode,
	#superclass : #CDAbstractTraitCompositionNode,
	#instVars : [
		'name'
	],
	#category : #ClassParser
}

{ #category : #testing }
CDTraitNode >> isTraitNode [

	^ true
]

{ #category : #accessing }
CDTraitNode >> name: aString [ 
	name := aString
]
