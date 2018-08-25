Class {
	#name : #CDClassWithTraitParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDClassWithTraitParserTest >> classDefinitionString [

^ 'MySuperclass subclass: #MyClass
		uses: MyTrait
		instanceVariableNames: ''x y''
		classVariableNames: ''X Y''
		package: #MyPackage'
]
