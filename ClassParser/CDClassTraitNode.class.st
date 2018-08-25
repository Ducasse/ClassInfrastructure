Class {
	#name : #CDClassTraitNode,
	#superclass : #CDAbstractTraitCompositionNode,
	#instVars : [
		'name'
	],
	#category : #'ClassParser-Model'
}

{ #category : #testing }
CDClassTraitNode >> isTraitNode [

	^ true
]

{ #category : #accessing }
CDClassTraitNode >> name: aString [ 
	name := aString
]
