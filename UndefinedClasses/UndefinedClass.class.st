"
Test Cases:

 - Have an undefined class with methods and change the superclass
 - Have an undefined class and instantiate it
 - Have an undefined class with a subclass and instantiate a subclass
 - Have an undefined class 
"
Class {
	#name : #UndefinedClass,
	#superclass : #Object,
	#category : #UndefinedClasses
}

{ #category : #'instance creation' }
UndefinedClass class >> basicNew [
	
	UndefinedClassError signal: 'Cannot instantiate undefined class: ', self name
]

{ #category : #building }
UndefinedClass class >> createUndefinedClassNamed: aString package: aPackageName [
	
	^ self
		subclass: aString
		instanceVariableNames: ''
		classVariableNames: ''
		package: aPackageName
]

{ #category : #'reflective operations' }
UndefinedClass >> doesNotUnderstand: aMessage [
	
	UndefinedClassError signal
]
