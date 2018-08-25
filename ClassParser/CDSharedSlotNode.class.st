Class {
	#name : #CDSharedSlotNode,
	#superclass : #Object,
	#instVars : [
		'slot',
		'node'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDSharedSlotNode class >> slot: aSlot node: aNode [ 
	
	^ self new
		slot: aSlot;
		node: aNode;
		yourself
]

{ #category : #accessing }
CDSharedSlotNode >> name [

	^ slot name
]

{ #category : #accessing }
CDSharedSlotNode >> node: aNode [ 
	node := aNode
]

{ #category : #accessing }
CDSharedSlotNode >> slot: aSharedSlot [ 
	slot := aSharedSlot
]
