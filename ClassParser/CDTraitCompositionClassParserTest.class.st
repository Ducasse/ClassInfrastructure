Class {
	#name : #CDTraitCompositionClassParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDTraitCompositionClassParserTest >> classDefinitionString [

^ 'MySuperclass subclass: #MyClass
		uses: {traitDefinition}
		instanceVariableNames: ''{instvar1} {instvar2}''
		classVariableNames: ''{classvar1} {classvar2}''
		package: #MyPackage'
			format: {
				'instvar1' -> self firstInstanceVariableName.
				'instvar2' -> self secondInstanceVariableName.
				'classvar1' -> self firstClassVariableName.
				'classvar2' -> self secondClassVariableName.
				'traitDefinition' -> self traitDefinition } asDictionary
]

{ #category : #tests }
CDTraitCompositionClassParserTest >> testBestNodeForTraitCompositionSelectionShouldBeTraitComposition [

	| definition selectedNode start selection |
	
	definition := CDClassParser parse: self classDefinitionString.
	
	start := self traitDefinitionIndex.
	selection := start to: start.
	
	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode isTraitComposition
]

{ #category : #helpers }
CDTraitCompositionClassParserTest >> traitDefinition [

	self subclassResponsibility
]

{ #category : #helpers }
CDTraitCompositionClassParserTest >> traitDefinitionIndex [

	^ self classDefinitionString findString: self traitDefinition
]
