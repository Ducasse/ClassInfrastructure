Class {
	#name : #CDClassWithComplexTraitCompositionParserTest,
	#superclass : #CDTraitCompositionClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDClassWithComplexTraitCompositionParserTest >> traitDefinition [

	^ 'MyTrait + (AnotherTrait - {#selector} @ {#selector1 -> #selector})'
]
