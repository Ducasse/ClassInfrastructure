Class {
	#name : #CDSharedSlotNode,
	#superclass : #CDSlotNode,
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDSharedSlotNode class >> slot: aSlot node: aNode [ 
	
	^ self new
		slot: aSlot;
		node: aNode;
		yourself
]
