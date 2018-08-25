"
use: T1 + T2
"
Class {
	#name : #CDTraitCompositionSequenceNode,
	#superclass : #CDTraitCompositionNode,
	#instVars : [
		'sequence'
	],
	#category : #'ClassParser-Model'
}

{ #category : #testing }
CDTraitCompositionSequenceNode >> isTraitSequenceNode [
	
	^ true
]

{ #category : #accessing }
CDTraitCompositionSequenceNode >> sequence: aCollection [ 
	sequence := aCollection
]
