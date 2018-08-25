Class {
	#name : #CDSlotNode,
	#superclass : #CDNode,
	#instVars : [
		'slot',
		'node',
		'index',
		'start',
		'stop'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDSlotNode class >> slot: aSlot node: aNode start: start stop: stop [
	
	^ self new
		slot: aSlot;
		node: aNode;
		start: start;
		stop: stop;
		yourself
]

{ #category : #selection }
CDSlotNode >> children [

	^ #( )
]

{ #category : #accessing }
CDSlotNode >> index: anInteger [ 
	
	index := anInteger
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

{ #category : #selection }
CDSlotNode >> start [

	^ start
]

{ #category : #accessing }
CDSlotNode >> start: anInteger [ 
	start := anInteger
]

{ #category : #selection }
CDSlotNode >> stop [
	^ stop
]

{ #category : #accessing }
CDSlotNode >> stop: anInteger [ 
	
	stop := anInteger
]
