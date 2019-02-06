"
I am a parser in use for generating an AST of classes from a string
"
Class {
	#name : #MinimalClassParser,
	#superclass : #Object,
	#instVars : [
		'className',
		'superClassName',
		'originalString',
		'packageName'
	],
	#category : #'UndefinedClasses-Core'
}

{ #category : #accessing }
MinimalClassParser >> className [ 
	^ className

]

{ #category : #testing }
MinimalClassParser >> isSuperClassDefined [
	^ self class environment includesKey: superClassName 
]

{ #category : #accessing }
MinimalClassParser >> originalString [
	^ originalString
]

{ #category : #accessing }
MinimalClassParser >> packageName [
	^ packageName
]

{ #category : #parsing }
MinimalClassParser >> parseDefinition: aString [
	| tokens |
	originalString := aString.
	tokens := [:c| c isSeparator] split: aString.
	className := tokens third.
	superClassName := tokens first.
	packageName := tokens last.
]

{ #category : #accessing }
MinimalClassParser >> superClassName [ 
	^ superClassName 	
]

{ #category : #accessing }
MinimalClassParser >> undefinedClassDefinition [

	| endPart newDefinition |
	endPart := (originalString copyAfter: Character space).
	newDefinition := UndefinedClass name, ' ', endPart.
	^ newDefinition
]
