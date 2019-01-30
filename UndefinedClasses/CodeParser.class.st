Class {
	#name : #CodeParser,
	#superclass : #Object,
	#category : #'UndefinedClasses-Core'
}

{ #category : #parsing }
CodeParser class >> parse: aString [ 
	
	^ self new parse: aString
]

{ #category : #parsing }
CodeParser >> parse: aString [
	"Return an AST"
	 
	| ast |
	^ [ RBParser parseMethod: aString ]
		on: Notification
		do: [  ast := RBParser parseExpression: aString.
				[ CDClassDefinitionParser fromASTNode: ast ]
					on: Notification
					do: [ ast ] ]
]
