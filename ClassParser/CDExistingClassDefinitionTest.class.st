Class {
	#name : #CDExistingClassDefinitionTest,
	#superclass : #CDBehaviorParserTest,
	#category : #'ClassParser-Test'
}

{ #category : #helpers }
CDExistingClassDefinitionTest >> classDefinitionString [

	^CDClassWithFullDefinitionExample definitionForNautilus 
]

{ #category : #helpers }
CDExistingClassDefinitionTest >> className [

	^ CDClassWithFullDefinitionExample name
]

{ #category : #helpers }
CDExistingClassDefinitionTest >> firstInstanceVariableName [
	
	^ 'instVar1' 
]

{ #category : #helpers }
CDExistingClassDefinitionTest >> secondInstanceVariableName [

	^ 'instVar2'
]

{ #category : #helpers }
CDExistingClassDefinitionTest >> testInstanceVariableNodeIsVariable [
	
	| slotNode |
	slotNode := classDefinition slotNodes first.
	self assert: slotNode isVariable
]
