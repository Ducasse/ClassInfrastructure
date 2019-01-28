Class {
	#name : #UndefinedClassHandler,
	#superclass : #Object,
	#category : #'UndefinedClasses-Core'
}

{ #category : #handle }
UndefinedClassHandler >> handleDefinitionString: aString [
	
	^ self handleDefinitionWithParser: (MinimalClassParser new parseDefinition: aString)
]

{ #category : #handle }
UndefinedClassHandler >> handleDefinitionWithParser: aParser [

	| newClass |
	self class environment
		at: aParser className
		ifPresent: [ :class | ^ class ].

	UndefinedClass
		createUndefinedClassNamed: aParser superClassName
		package: aParser packageName.
	newClass := Smalltalk compilerClass new
		source: aParser originalString;
		evaluate.
	^ newClass
]
