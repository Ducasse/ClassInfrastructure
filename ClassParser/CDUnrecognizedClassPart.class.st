Class {
	#name : #CDUnrecognizedClassPart,
	#superclass : #Notification,
	#instVars : [
		'unrecognizedPart'
	],
	#category : #ClassParser
}

{ #category : #accessing }
CDUnrecognizedClassPart >> unrecognizedPart: aString [ 
	unrecognizedPart := aString
]
