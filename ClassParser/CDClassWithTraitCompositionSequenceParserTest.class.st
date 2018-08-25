Class {
	#name : #CDClassWithTraitCompositionSequenceParserTest,
	#superclass : #CDTraitCompositionClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDClassWithTraitCompositionSequenceParserTest >> testTraitDefinitionNodeIsTraitSequenceNode [

	self assert: self traitCompositionNode isTraitSequenceNode
]

{ #category : #helpers }
CDClassWithTraitCompositionSequenceParserTest >> traitDefinition [

	^ 'MyTrait + (AnotherTrait - {#selector} @ {#selector1 -> #selector})'
]
