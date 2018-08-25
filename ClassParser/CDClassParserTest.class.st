Class {
	#name : #CDClassParserTest,
	#superclass : #TestCase,
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

{ #category : #tests }
CDClassParserTest >> testBestNodeForClassNameSelectionShouldBeClassNameNode [

	| definition selectedNode start selection |
	definition := CDClassParser parse: self classDefinitionString.
	
	start := definition definitionExpressionTree arguments first start.
	selection := start to: start.
	
	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode equals: definition classNameNode
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForClassVariableSelectionShouldBeClassSlotNode [

	| definition selectedNode start selection |
	definition := CDClassParser parse: self classDefinitionString.
	
	start := self firstClassVariableIndex.
	selection := start to: start.
	
	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode equals: definition sharedSlots first
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForInstanceVariableSelectionShouldBeSlotNode [

	| definition selectedNode start selection |
	definition := CDClassParser parse: self classDefinitionString.
	
	start := self firstInstanceVariableIndex.
	selection := start to: start.
	
	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode equals: definition slotNodes first
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForSecondInstanceVariableSelectionShouldBeSecondSlotNode [

	| definition selectedNode start selection |
	definition := CDClassParser parse: self classDefinitionString.
	
	start := self secondInstanceVariableIndex.
	selection := start to: start.
	
	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode equals: definition slotNodes second
]

{ #category : #tests }
CDClassParserTest >> testBestNodeForSuperclassSelectionShouldBeSuperclassNameNode [

	| definition selectedNode start selection |
	definition := CDClassParser parse: self classDefinitionString.

	start := definition definitionExpressionTree receiver start.
	selection := start to: start.

	selectedNode := definition bestNodeFor: selection.
	self assert: selectedNode equals: definition superclassNameNode
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassName [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition className == #MyClass.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassNameNode [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition classNameNode value equals: #MyClass.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasClassSlots [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition sharedSlotNodes first name equals: self firstClassVariableName.
	self assert: definition sharedSlotNodes second name equals: self secondClassVariableName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasPackageName [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition packageName == #MyPackage.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasPackageNameNode [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition packageNameNode value equals: #MyPackage.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSlots [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition slotNodes first name equals: self firstInstanceVariableName.
	self assert: definition slotNodes second name equals: self secondInstanceVariableName.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassName [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition superclassName equals: #MySuperclass.
]

{ #category : #tests }
CDClassParserTest >> testClassDefinitionFromLegacyClassDefinitionStringHasSuperclassNameNode [

	| definition |
	definition := CDClassParser parse: self classDefinitionString.

	self assert: definition superclassNameNode name equals: #MySuperclass.
]
