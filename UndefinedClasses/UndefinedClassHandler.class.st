"
I'm responsible for the creation of UndefinedClasses. 

I'm used by ClassDefinitionHandler (which will be merged into another infrastructure class) and I use the MinimalClassParser to extract information so that I can create a undefined class. 
"
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
