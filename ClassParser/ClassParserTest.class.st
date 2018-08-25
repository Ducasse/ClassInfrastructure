Class {
	#name : #ClassParserTest,
	#superclass : #TestCase,
	#category : #ClassParser
}

{ #category : #'specific fixture' }
ClassParserTest >> byteClassDefinition [

	^ 'Object variableByteSubclass: #Point
		instanceVariableNames: ''x y''
		classVariableNames: ''''
		package: ''Kernel-BasicObjects'''
]

{ #category : #tests }
ClassParserTest >> classDefinition [

	^ self pointClassDefinition
]

{ #category : #tests }
ClassParserTest >> classDefinitionAsTokens [

	^ self pointClassDefinitionAsTokens 
]

{ #category : #'specific fixture' }
ClassParserTest >> pointClassDefinition [

	^ 'Object subclass: #Point
		instanceVariableNames: ''x y''
		classVariableNames: ''''
		package: ''Kernel-BasicObjects'''
]

{ #category : #'specific fixture' }
ClassParserTest >> pointClassDefinitionAsTokens [

	^ (Parser new scanTokens: self pointClassDefinition)
]

{ #category : #tests }
ClassParserTest >> testByteClassDefinitionHasAPackageDefinition [

	| definition | 
	definition := ClassParser parse: self byteClassDefinition.
	self assert: definition packageName equals: self classDefinitionAsTokens last
]

{ #category : #tests }
ClassParserTest >> testByteClassDefinitionHasAVariableDefinition [

	| definition | 
	definition := ClassParser parse: self byteClassDefinition.
	self assert: definition instanceVariables first name = ((self classDefinitionAsTokens at: 5) findTokens: Character space) first.

]

{ #category : #tests }
ClassParserTest >> testByteClassDefinitionNames [

	| definition | 
	definition := ClassParser parse: self byteClassDefinition.
	self assert: definition superclassName = self classDefinitionAsTokens first.
	self assert: definition name = self classDefinitionAsTokens third asString.
	self assert: definition packageName = self classDefinitionAsTokens last.
]

{ #category : #tests }
ClassParserTest >> testByteClassDefinitionRawProperties [
	"we check the properties of the node entity and not its children. 
	For now we modelled the instance variables and packages as other nodes."
	
	| definition | 
	definition := ClassParser parse: self byteClassDefinition.
	self assert: definition superclassName = self classDefinitionAsTokens first.
	self assert: definition name = self classDefinitionAsTokens third asString.
	self assert: definition selectorParts = (Parser new scanTokens: self byteClassDefinition) unzip second.

]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionHasAPackageDefinition [

	| definition | 
	definition := ClassParser parse: self classDefinition.
	self assert: definition packageName equals: self classDefinitionAsTokens last
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionHasAVariableDefinition [

	| definition | 
	definition := ClassParser parse: self classDefinition.
	self assert: definition instanceVariables first name = ((self classDefinitionAsTokens at: 5) findTokens: Character space) first.

]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionNames [

	| definition | 
	definition := ClassParser parse: self classDefinition.
	self assert: definition superclassName = self classDefinitionAsTokens first.
	self assert: definition name = self classDefinitionAsTokens third asString.
	self assert: definition packageName = self classDefinitionAsTokens last.
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionRawProperties [
	"we check the properties of the node entity and not its children. 
	For now we modelled the instance variables and packages as other nodes."
	
	| definition | 
	definition := ClassParser parse: self classDefinition.
	self assert: definition superclassName = self classDefinitionAsTokens first.
	self assert: definition name = self classDefinitionAsTokens third asString.
	self assert: definition selectorParts = self classDefinitionAsTokens unzip second.

]

{ #category : #'tests every' }
ClassParserTest >> testSelectEvery [

	 self assert: (#(#Object #subclass: #Point #instanceVariableNames: 'x y' #classVariableNames: '' #package: 'Kernel-BasicObjects') selectEvery: [ :i | i\\2 =0 ]) asArray equals: #(#subclass: #instanceVariableNames: #classVariableNames: #package:)
		
]

{ #category : #'tests every' }
ClassParserTest >> testSelectEveryFirst [

	 self assert: (#(#Object #subclass: #Point #instanceVariableNames: 'x y' #classVariableNames: '' #package: 'Kernel-BasicObjects') selectEveryFirst) asArray equals: #(#Object #Point 'x y'  '' 'Kernel-BasicObjects')
		
]

{ #category : #'tests every' }
ClassParserTest >> testSelectEverySecond [

	 self assert: (#(#Object #subclass: #Point #instanceVariableNames: 'x y' #classVariableNames: '' #package: 'Kernel-BasicObjects') selectEverySecond) asArray equals: #(#subclass: #instanceVariableNames: #classVariableNames: #package:)
		
]

{ #category : #'tests every' }
ClassParserTest >> testUnzip [
	| uz |
	uz := #(#Object #subclass: #Point #instanceVariableNames: 'x y' #classVariableNames: '' #package: 'Kernel-BasicObjects') unzip.
	
	 self assert: uz first asArray equals:	#(#Object #Point 'x y'  '' 'Kernel-BasicObjects').
	 self assert: uz second asArray equals: #(#subclass: #instanceVariableNames: #classVariableNames: #package:)
		 
]
