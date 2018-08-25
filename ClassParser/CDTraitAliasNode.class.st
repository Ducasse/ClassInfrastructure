"
MyTrait @ {#aliasName -> #existingSelectorName}
"
Class {
	#name : #CDTraitAliasNode,
	#superclass : #CDTraitCompositionNode,
	#instVars : [
		'aliases',
		'aliasName'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDTraitAliasNode >> aliasName [
	
	^ aliasName
]

{ #category : #accessing }
CDTraitAliasNode >> aliases [
	^ aliases
]

{ #category : #accessing }
CDTraitAliasNode >> aliases: aCollection [ 
	aliases := aCollection asDictionary
]

{ #category : #testing }
CDTraitAliasNode >> isTraitAliasNode [
	
	^ true
]
