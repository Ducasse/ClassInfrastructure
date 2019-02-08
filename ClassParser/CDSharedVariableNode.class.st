Class {
	#name : #CDSharedVariableNode,
	#superclass : #CDSlotNode,
	#category : #'ClassParser-Model'
}

{ #category : #'instance-creation' }
CDSharedVariableNode class >> slot: aSlot node: aNode [ 
	
	^ self new
		slot: aSlot;
		node: aNode;
		yourself
]

{ #category : #suggestions }
CDSharedVariableNode >> specialCommands [
	
	^ SugsSuggestionFactory commandsForClassVariable
]
