"
MyTrait - {#aliasName}
"
Class {
	#name : #CDTraitExclusionNode,
	#superclass : #CDTraitCompositionNode,
	#instVars : [
		'exclusions'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDTraitExclusionNode >> exclusions: aCollection [ 
	exclusions := aCollection
]

{ #category : #testing }
CDTraitExclusionNode >> isTraitExclusionNode [
	
	^ true
]
