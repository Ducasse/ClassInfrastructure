Class {
	#name : #SubclassClassParserTest,
	#superclass : #ClassParserTest,
	#category : #ClassParser
}

{ #category : #tests }
SubclassClassParserTest >> classDefinition [

	^ self pointClassDefinition
]

{ #category : #tests }
SubclassClassParserTest >> classDefinitionAsTokens [

	^ self pointClassDefinitionAsTokens 
]

{ #category : #'specific fixture' }
SubclassClassParserTest >> pointClassDefinition [

	^ 'Object subclass: #Point
		instanceVariableNames: ''x y''
		classVariableNames: ''''
		package: ''Kernel-BasicObjects'''
]

{ #category : #'specific fixture' }
SubclassClassParserTest >> pointClassDefinitionAsTokens [

	^ (Parser new scanTokens: self pointClassDefinition)
]
