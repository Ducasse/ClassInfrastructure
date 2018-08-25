Class {
	#name : #VariableSubclassClassParserTest,
	#superclass : #ClassParserTest,
	#category : #ClassParser
}

{ #category : #tests }
VariableSubclassClassParserTest >> arrayClassDefinition [

	^ 'ArrayedCollection variableSubclass: #Array
	instanceVariableNames: ''zork plouf''
	classVariableNames: ''''
	package: ''Collections-Sequenceable'''
]

{ #category : #tests }
VariableSubclassClassParserTest >> arrayClassDefinitionAsTokens [

	^ (Parser new scanTokens: self arrayClassDefinition)
]

{ #category : #tests }
VariableSubclassClassParserTest >> classDefinition [

	^ self arrayClassDefinition
]

{ #category : #tests }
VariableSubclassClassParserTest >> classDefinitionAsTokens [

	^ self arrayClassDefinitionAsTokens 
]
