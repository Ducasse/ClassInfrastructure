Class {
	#name : #CDSlotNode,
	#superclass : #CDNode,
	#instVars : [
		'slot',
		'node',
		'index',
		'start',
		'stop',
		'name',
		'typeName'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDSlotNode class >> node: aNode name: aName typeName: aTypeName start: start stop: stop [
	
	^ self new
		node: aNode;
		name: aName;
		typeName: aTypeName;
		start: start;
		stop: stop;
		yourself
]

{ #category : #accessing }
CDSlotNode >> index: anInteger [ 
	
	index := anInteger
]

{ #category : #accessing }
CDSlotNode >> name [

	^ name
]

{ #category : #accessing }
CDSlotNode >> name: aString [

	name := aString
]

{ #category : #accessing }
CDSlotNode >> node: aNode [ 
	node := aNode
]

{ #category : #printing }
CDSlotNode >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: name;
		nextPutAll: ' => ';
		nextPutAll: typeName;
		nextPutAll: ')'
]

{ #category : #suggestions }
CDSlotNode >> specialCommands [
	
	^ SugsSuggestionFactory commandsForInstanceVariable
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

{ #category : #accessing }
CDSlotNode >> typeName: aString [ 
	
	typeName := aString
]
