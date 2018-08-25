Class {
	#name : #CDTraitCompositionSequenceNode,
	#superclass : #CDTraitCompositionNode,
	#instVars : [
		'sequence'
	],
	#category : #ClassParser
}

{ #category : #testing }
CDTraitCompositionSequenceNode >> isTraitSequenceNode [
	
	^ true
]

{ #category : #accessing }
CDTraitCompositionSequenceNode >> sequence: aCollection [ 
	sequence := aCollection
]
