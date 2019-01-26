Class {
	#name : #CDClassNameNode,
	#superclass : #CDNode,
	#instVars : [
		'className'
	],
	#category : #'ClassParser-Model'
}

{ #category : #accessing }
CDClassNameNode >> binding [
	| classBinding |
	classBinding := originalNode methodNode compilationContext environment bindingOf: className.
	^OCLiteralVariable new 
		scope: originalNode scope;
		assoc: classBinding
]

{ #category : #accessing }
CDClassNameNode >> className [
	
	^ className
]

{ #category : #accessing }
CDClassNameNode >> className: aString [ 
	
	className := aString
]

{ #category : #testing }
CDClassNameNode >> isTemp [
	^false
]

{ #category : #testing }
CDClassNameNode >> isVariable [
	^(originalNode methodNode compilationContext environment bindingOf: className) notNil
]

{ #category : #accessing }
CDClassNameNode >> name [
	
	^ className
]

{ #category : #accessing }
CDClassNameNode >> value [
	
	^ className
]
