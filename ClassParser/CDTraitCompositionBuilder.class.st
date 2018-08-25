Class {
	#name : #CDTraitCompositionBuilder,
	#superclass : #Object,
	#category : #ClassParser
}

{ #category : #building }
CDTraitCompositionBuilder >> buildFrom: aNode [
	
	^ aNode acceptVisitor: self
]

{ #category : #visiting }
CDTraitCompositionBuilder >> visitArrayNode: aRBArrayNode [ 
	
	^ aRBArrayNode statements collect: [ :each | each value ]
]

{ #category : #visiting }
CDTraitCompositionBuilder >> visitMessageNode: aRBMessageNode [ 
	
	| node receiver argument |
	receiver := aRBMessageNode receiver acceptVisitor: self.
	argument := aRBMessageNode arguments first acceptVisitor: self.
	
	node := receiver perform: aRBMessageNode selector with: argument.
	node originalNode: aRBMessageNode.
	^ node
]

{ #category : #visiting }
CDTraitCompositionBuilder >> visitVariableNode: aRBVariableNode [ 
	
	^ CDTraitNode new
		originalNode: aRBVariableNode;
		name: aRBVariableNode name;
		yourself
]
