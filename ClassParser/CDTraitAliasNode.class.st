Class {
	#name : #CDTraitAliasNode,
	#superclass : #CDTraitCompositionNode,
	#instVars : [
		'aliases'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDTraitAliasNode >> aliases: aCollection [ 
	aliases := aCollection
]
