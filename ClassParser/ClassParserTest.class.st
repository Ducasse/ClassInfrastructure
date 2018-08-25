Class {
	#name : #ClassParserTest,
	#superclass : #TestCase,
	#category : #ClassParser
}

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionHasAPackageDefinition [

	| parser | 
	parser := ClassParser new parse: self classDefinition.
	self assert: parser definition package name = self classDefinitionAsTokens last
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionHasAVariableDefinition [

	| parser | 
	parser := ClassParser new parse: self classDefinition.
	self assert: parser definition instanceVariables first name = ((self classDefinitionAsTokens at: 5) findTokens: Character space) first.

]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionNames [

	| parser | 
	parser := ClassParser new parse: self classDefinition.
	self assert: parser definition superclassName = self classDefinitionAsTokens first.
	self assert: parser definition name = self classDefinitionAsTokens third asString.
	self assert: parser definition packageName = self classDefinitionAsTokens last.
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionRawProperties [
	"we check the properties of the node entity and not its children. 
	For now we modelled the instance variables and packages as other nodes."
	
	| parser | 
	parser := ClassParser new parse: self classDefinition.
	self assert: parser definition superclassName = self classDefinitionAsTokens first.
	self assert: parser definition name = self classDefinitionAsTokens third asString.
	self assert: parser definition selectorParts = self classDefinitionAsTokens unzip second.

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
