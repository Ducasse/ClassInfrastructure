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
