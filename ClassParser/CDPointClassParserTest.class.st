Class {
	#name : #CDPointClassParserTest,
	#superclass : #CDClassParserTest,
	#category : #'ClassParser-Test'
}

{ #category : #helpers }
CDPointClassParserTest >> classDefinitionString [

	^ 'Object subclass: #Point
	instanceVariableNames: ''x y''
	classVariableNames: ''''
	package: ''Kernel-BasicObjects'''
]

{ #category : #helpers }
CDPointClassParserTest >> testProperties [

	self assert: classDefinition binding equals: Point binding
]
