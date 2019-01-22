Class {
	#name : #CDClassParserTest,
	#superclass : #CDBehaviorParserTest,
	#category : #'ClassParser-Test'
}

{ #category : #testing }
CDClassParserTest class >> isAbstract [
	^ self == CDClassParserTest
]

{ #category : #helpers }
CDClassParserTest >> firstClassVariableIndex [

	^ self classDefinitionString findString: self firstClassVariableName
]

{ #category : #helpers }
CDClassParserTest >> firstClassVariableName [

	^ 'firstClass'
]

{ #category : #tests }
CDClassParserTest >> packageName [
	^  #MyPackage
]

{ #category : #helpers }
CDClassParserTest >> secondClassVariableName [

	^ 'secondClass'
]

{ #category : #helpers }
CDClassParserTest >> superclassName [

	^ 'TheSuperClass'
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForClassVariableSelectionShouldBeClassSlotNode [

	| selectedNode selection |	
	selection := self selectionOf: self firstClassVariableName.
	
	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition sharedSlots first
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForSuperclassSelectionShouldBeSuperclassNameNode [

	| selectedNode selection |
	selection := self selectionOf: self superclassName.

	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition superclassNameNode
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassNameNode [

	self assert: classDefinition classNameNode value equals: self className.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassSlots [

	self assert: classDefinition sharedSlotNodes first name equals: self firstClassVariableName.
	self assert: classDefinition sharedSlotNodes second name equals: self secondClassVariableName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasPackageName [

	self assert: classDefinition packageName equals: self packageName
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasPackageNameNode [

	self assert: classDefinition packageNameNode value equals: self packageName
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSharedSlots [

	self assert: classDefinition sharedSlots first name equals: self firstClassVariableName.
	self assert: classDefinition sharedSlots second name equals: self secondClassVariableName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassName [

	self assert: classDefinition superclassName equals: self superclassName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassNameNode [

	self assert: classDefinition superclassNameNode name equals: self superclassName.
]
