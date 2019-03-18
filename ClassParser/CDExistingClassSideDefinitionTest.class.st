Class {
	#name : #CDExistingClassSideDefinitionTest,
	#superclass : #CDExistingClassDefinitionTest,
	#category : #'ClassParser-Test'
}

{ #category : #helpers }
CDExistingClassSideDefinitionTest >> classDefinitionString [

	^CDClassWithFullDefinitionExample class definitionForNautilus 
]

{ #category : #helpers }
CDExistingClassSideDefinitionTest >> firstInstanceVariableName [
	
	^ 'classSideVar1' 
]

{ #category : #helpers }
CDExistingClassSideDefinitionTest >> secondInstanceVariableName [

	^ 'classSideVar2'
]

{ #category : #helpers }
CDExistingClassSideDefinitionTest >> testGettingExistingClass [
	
	| class |
	class := classDefinition existingClassIfAbsent: [].
	self assert: class equals: CDClassWithFullDefinitionExample class
]