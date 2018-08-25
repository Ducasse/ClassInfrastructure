Class {
	#name : #CDClassNameNode,
	#superclass : #CDNode,
	#instVars : [
		'className'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDClassNameNode >> className [
	
	^ className
]

{ #category : #accessing }
CDClassNameNode >> className: aString [ 
	
	className := aString
]

{ #category : #accessing }
CDClassNameNode >> name [
	
	^ className
]

{ #category : #accessing }
CDClassNameNode >> value [
	
	^ className
]
