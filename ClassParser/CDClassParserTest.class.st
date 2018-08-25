Class {
	#name : #CDClassParserTest,
	#superclass : #TestCase,
	#instVars : [
		'classDefinition'
	],
	#category : #ClassParser
}

{ #category : #testing }
CDClassParserTest class >> isAbstract [
	^ self == CDClassParserTest
]

{ #category : #helpers }
CDClassParserTest >> classDefinitionString [

	self subclassResponsibility
]

{ #category : #helpers }
CDClassParserTest >> className [

	^ 'TheClass'
]

{ #category : #helpers }
CDClassParserTest >> firstClassVariableIndex [

	^ self classDefinitionString findString: self firstClassVariableName
]

{ #category : #helpers }
CDClassParserTest >> firstClassVariableName [

	^ 'firstClass'
]

{ #category : #helpers }
CDClassParserTest >> firstInstanceVariableIndex [

	^ self classDefinitionString findString: self firstInstanceVariableName
]

{ #category : #helpers }
CDClassParserTest >> firstInstanceVariableName [

	^ 'first'
]

{ #category : #helpers }
CDClassParserTest >> nodeFor: aString [ 
	
	^ classDefinition bestNodeFor: (self selectionOf: aString)
]

{ #category : #helpers }
CDClassParserTest >> secondClassVariableIndex [

	^ self classDefinitionString findString: self secondClassVariableName
]

{ #category : #helpers }
CDClassParserTest >> secondClassVariableName [

	^ 'secondClass'
]

{ #category : #helpers }
CDClassParserTest >> secondInstanceVariableIndex [

	^ self classDefinitionString findString: self secondInstanceVariableName
]

{ #category : #helpers }
CDClassParserTest >> secondInstanceVariableName [

	^ 'second'
]

{ #category : #helpers }
CDClassParserTest >> selectionOf: aText [

	| start |
	start := self classDefinitionString findString: aText.
	^ start to: start
]

{ #category : #tests }
CDClassParserTest >> setUp [

	super setUp.
	
	classDefinition := CDClassParser parse: self classDefinitionString.
]

{ #category : #helpers }
CDClassParserTest >> superclassName [

	^ 'TheSuperClass'
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForClassNameSelectionShouldBeClassNameNode [

	| selectedNode selection |
	
	selection := self selectionOf: self className.
	
	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition classNameNode
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForClassVariableSelectionShouldBeClassSlotNode [

	| selectedNode selection |	
	selection := self selectionOf: self firstClassVariableName.
	
	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition sharedSlots first
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForInstanceVariableSelectionShouldBeSlotNode [

	| selectedNode selection |	
	selection := self selectionOf: self firstInstanceVariableName.
	
	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition slotNodes first
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForSecondInstanceVariableSelectionShouldBeSecondSlotNode [

	| selectedNode selection |
	selection := self selectionOf: self secondInstanceVariableName.
	
	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition slotNodes second
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForSuperclassSelectionShouldBeSuperclassNameNode [

	| selectedNode selection |
	selection := self selectionOf: self superclassName.

	selectedNode := classDefinition bestNodeFor: selection.
	self assert: selectedNode equals: classDefinition superclassNameNode
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassName [

	self assert: classDefinition className equals: self className.
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

	self assert: classDefinition packageName == #MyPackage.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasPackageNameNode [

	self assert: classDefinition packageNameNode value equals: #MyPackage.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSlots [

	self assert: classDefinition slotNodes first name equals: self firstInstanceVariableName.
	self assert: classDefinition slotNodes second name equals: self secondInstanceVariableName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassName [

	self assert: classDefinition superclassName equals: self superclassName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassNameNode [

	self assert: classDefinition superclassNameNode name equals: self superclassName.
]
