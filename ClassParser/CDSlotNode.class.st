Class {
	#name : #CDSlotNode,
	#superclass : #Object,
	#instVars : [
		'slot',
		'node'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDSlotNode class >> slot: aSlot node: aNode [ 
	
	^ self new
		slot: aSlot;
		node: aNode;
		yourself
]

{ #category : #accessing }
CDSlotNode >> name [

	^ slot name
]

{ #category : #accessing }
CDSlotNode >> node: aNode [ 
	node := aNode
]

{ #category : #accessing }
CDSlotNode >> slot: aSlot [ 
	slot := aSlot
]
