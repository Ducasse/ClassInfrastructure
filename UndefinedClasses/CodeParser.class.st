Class {
	#name : #CodeParser,
	#superclass : #Object,
	#category : #UndefinedClasses
}

{ #category : #parsing }
CodeParser class >> parse: aString [ 
	
	^ self new
		parse: aString
]

{ #category : #parsing }
CodeParser >> parse: aString [ 
	| ast |
	
	^ [ RBParser parseMethod: aString ]
		on: Notification
		do: [  ast := RBParser parseExpression: aString.
				[ CDClassParser fromASTNode: ast ]
					on: Notification
					do: [ ast ] ]
]
