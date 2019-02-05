"
I'm responsible for the creation of class or undefinedClass subclasses when needed.
I will be merged in a system class in the future. Right now I'm here to play the game of an infrastructure class. 

I use UndefinedClassHandler to manage undefined classes. 
"
Class {
	#name : #ClassDefinitionHandler,
	#superclass : #Object,
	#category : #'UndefinedClasses-Core'
}

{ #category : #compiling }
ClassDefinitionHandler class >> createClassFromDefinitionString: aString [
	"Parse the definition string. Check that the superclass, the traits, the pool dictionaries and the package required exist. If they do not exist, we create them, or we create an *undefined* version for them"
	
	| classDefinition newClass |
	classDefinition := CDClassDefinitionParser parse: aString.
	
	newClass := (self existsClassNamed: classDefinition superclassName)
		ifTrue: [ Smalltalk compiler evaluate: aString ] 
		ifFalse: [ UndefinedClassHandler new handleDefinitionString: aString ].
	
	^ newClass
]

{ #category : #compiling }
ClassDefinitionHandler class >> existsClassNamed: className [
	
	^ className = #nil or: [ self environment includesKey: className ]
]
