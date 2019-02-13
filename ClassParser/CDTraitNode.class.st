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
CDTraitNode >> name [
	^name 
]

{ #category : #accessing }
CDTraitNode >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
CDTraitNode >> toString [ 
	^self name
]
