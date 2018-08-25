Class {
	#name : #CDNormalClassParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDNormalClassParserTest >> classDefinitionString [

	^ 'MySuperclass subclass: #MyClass
		instanceVariableNames: ''x y''
		classVariableNames: ''X Y''
		package: #MyPackage'
]
