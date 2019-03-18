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

{ #category : #testing }
CDSharedSlotNode >> isClassVariable [
	"To be polymorphic to RB method nodes"
	^true
]

{ #category : #testing }
CDSharedSlotNode >> isInstance [
	"To be polymorphic to RB method nodes"
	^false
]

{ #category : #testing }
CDSharedSlotNode >> isVariable [
	"To be polymorphic to RB method nodes"
	| existingClass |
	existingClass := self classDefinitionNode existingClassIfAbsent: [   
		"Until class will be created the variables does not exist yet" 
		^false ].
	^existingClass hasClassVarNamed: name asSymbol
]

{ #category : #suggestions }
CDSharedSlotNode >> specialCommands [
	
	^ SugsSuggestionFactory commandsForClassVariable
]
