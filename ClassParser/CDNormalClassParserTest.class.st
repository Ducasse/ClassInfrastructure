Class {
	#name : #CDNormalClassParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDNormalClassParserTest >> classDefinitionString [

	^ 'MySuperclass subclass: #MyClass
		instanceVariableNames: ''{instvar1} {instvar2}''
		classVariableNames: ''X Y''
		package: #MyPackage'
			format: { 
				'instvar1' -> self firstInstanceVariableName.
				'instvar2' -> self secondInstanceVariableName. } asDictionary
]
