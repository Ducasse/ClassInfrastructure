Class {
	#name : #CDUnrecognizedClassPart,
	#superclass : #Notification,
	#instVars : [
		'unrecognizedPart'
	],
	#category : #'ClassParser-Test'
}

{ #category : #accessing }
CDUnrecognizedClassPart >> unrecognizedPart: aString [ 
	unrecognizedPart := aString
]
