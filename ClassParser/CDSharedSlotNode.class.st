Class {
	#name : #CDSharedSlotNode,
	#superclass : #CDSlotNode,
	#category : #'ClassParser-Model'
}

{ #category : #'instance-creation' }
CDSharedSlotNode class >> slot: aSlot node: aNode [ 
	
	^ self new
		slot: aSlot;
		node: aNode;
		yourself
]

{ #category : #suggestions }
CDSharedSlotNode >> specialCommands [
	
	^ SugsSuggestionFactory commandsForClassVariable
]
