Class {
	#name : #CDClassParserTest,
	#superclass : #TestCase,
	#category : #ClassParser
}

{ #category : #helpers }
CDClassParserTest >> classDefinitionString [

	self subclassResponsibility
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

	self assert: definition sharedSlotNodes first name equals: #X.
	self assert: definition sharedSlotNodes second name equals: #Y.
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

	self assert: definition slotNodes first name equals: #x.
	self assert: definition slotNodes second name equals: #y.
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
