Class {
	#name : #CDTraitNode,
	#superclass : #CDAbstractTraitCompositionNode,
	#instVars : [
		'name'
	],
	#category : #'ClassParser-Model'
}

{ #category : #testing }
CDTraitNode >> isTraitNode [

	^ true
]

{ #category : #accessing }
CDTraitNode >> name: aString [ 
	name := aString
]
