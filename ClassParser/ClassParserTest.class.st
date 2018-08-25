Class {
	#name : #ClassParserTest,
	#superclass : #TestCase,
	#category : #ClassParser
}

{ #category : #tests }
ClassParserTest >> pointClassDefinition [

	^ 'Object subclass: #Point
		instanceVariableNames: ''x y''
		classVariableNames: ''''
		package: ''Kernel-BasicObjects'''
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinition [

	| parser | 
	parser := ClassParser new parse: self pointClassDefinition.
	self assert: parser definition superclassName = 'Object'.
	self assert: parser definition className = 'Point'.
	self assert: parser definition packageName = 'Kernel-BasicObjects'.
	self assert: parser definition instanceVariableNames = 'x y'
]

{ #category : #tests }
ClassParserTest >> testPointClassDefinitionRawProperties [
	"we check the properties of the node entity and not its children. 
	For now we modelled the instance variables and packages as other nodes."
	
	| parser | 
	parser := ClassParser new parse: self pointClassDefinition.
	self assert: parser definition superclassName = 'Object'.
	self assert: parser definition name = 'Point'.

]
