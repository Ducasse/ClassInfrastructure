Class {
	#name : #CDClassWithTraitParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDClassWithTraitParserTest >> classDefinitionString [

^ 'MySuperclass subclass: #MyClass
		uses: MyTrait
		instanceVariableNames: ''{instvar1} {instvar2}''
		classVariableNames: ''X Y''
		package: #MyPackage'
			format: { 
				'instvar1' -> self firstInstanceVariableName.
				'instvar2' -> self secondInstanceVariableName. } asDictionary
]
