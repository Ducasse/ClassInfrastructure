Class {
	#name : #UndefinedClassHandler,
	#superclass : #Object,
	#category : #UndefinedClasses
}

{ #category : #handle }
UndefinedClassHandler >> handleDefinitionString: aString [
	
	^ self handleDefinitionWithParser: (MinimalClassParser new parseDefinition: aString)
]

{ #category : #handle }
UndefinedClassHandler >> handleDefinitionWithParser: aParser [
	
	| newClass |
	self class environment at: aParser className ifPresent: [ :class | ^ class ].

	UndefinedClass createUndefinedClassNamed: aParser superClassName package: aParser packageName.
	newClass := Smalltalk compilerClass evaluate: aParser originalString.
	^ newClass
]
