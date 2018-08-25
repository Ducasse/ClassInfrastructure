"
I generate a tree of objects representing the definition of a class. 
I'm not a single object because I want to follow the design of an AST with the positions and the rest. 

For example class definition should support smart suggestions. 
"
Class {
	#name : #ClassParser,
	#superclass : #Object,
	#instVars : [
		'definition'
	],
	#category : #ClassParser
}

{ #category : #accessing }
ClassParser >> definition [

	^ definition ifNil: [ definition := ClassDefinitionNode new ]
]

{ #category : #parsing }
ClassParser >> parse: aString [

	| tokens |
	tokens := Parser new scanTokens: aString.
	self definition superclassName: tokens first.
	self definition name: tokens third. 
	 
]
