Class {
	#name : #ASTClassBuilderTest,
	#superclass : #TestCase,
	#category : #ASTClassBuilder
}

{ #category : #environmentSetUp }
ASTClassBuilderTest >> environment [
	^ ShSmalltalkGlobalsEnvironment new.
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassNamed [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Object subclass: #TestClass'.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class name equals: #TestClass
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassSuperClass [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass'.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class superclass equals: Class
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassWithClassVariable [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass
															classVariableNames: ''var classVar pouet'' '.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class classVariableString equals: '#classVar #pouet #var'
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassWithIV [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass
															instanceVariableNames: '''''.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class instanceVariablesString equals: ''
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassWithPackage [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass
															package: ''Kernel-Classes'''.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class category equals: #Unclassified
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassWithSharedPools [

   | ast class resTest|

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass
															poolDictionaries: ''TestSharedPool ShTestSharedPool'''.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
	resTest:= OrderedCollection new.
	resTest add: 'TestSharedPool' asSymbol.
	resTest add: 'ShTestSharedPool' asSymbol.
	self assert: class sharedPoolNames equals: resTest.
]

{ #category : #running }
ASTClassBuilderTest >> testCreateNormalClassWithSlots [

   | ast class |

	ast := CDClassDefinitionParser parse: 'Class subclass: #TestSubClass
															slots: {
																''cat'' => PropertySlot.
																''env'' => PropertySlot.
															}.'.
	class := ShiftClassBuilder new
		buildEnvironment: self environment;
		nameAST: ast;
		build.
		
	self assert: class instanceVariablesString equals: 'cat env'
]
