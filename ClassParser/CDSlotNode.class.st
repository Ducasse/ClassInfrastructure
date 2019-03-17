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
	#category : #'ClassParser-Model'
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

{ #category : #'as yet unclassified' }
CDSlotNode >> asCalypsoVariableOf: aClass [ 
	
	| className classBinding actualClass |
	className := self classDefinitionNode className.
	classBinding := node methodNode compilationContext environment bindingOf: className.
	classBinding ifNil: [ ^self error: 'Class not exists yet' ].
	actualClass := classBinding value.
	^actualClass 
		slotNamed: name asSymbol 
		ifFound: [:aSlot | 
			^ClyInstanceVariable on: aSlot definedIn: actualClass] 
		ifNone: [self error: 'Slot is not created yet']
]

{ #category : #accessing }
CDSlotNode >> binding [
	
	^self
]

{ #category : #accessing }
CDSlotNode >> index: anInteger [ 
	
	index := anInteger
]

{ #category : #testing }
CDSlotNode >> isClassVariable [
	^false
]

{ #category : #testing }
CDSlotNode >> isGlobalVariable [
	^false
]

{ #category : #testing }
CDSlotNode >> isInstance [
	^true
]

{ #category : #testing }
CDSlotNode >> isLiteralVariable [
	^false
]

{ #category : #testing }
CDSlotNode >> isTemp [
	^false
]

{ #category : #testing }
CDSlotNode >> isUndeclared [
	^false
]

{ #category : #testing }
CDSlotNode >> isVariable [
	| className classBinding existingClass |
	existingClass := self classDefinitionNode existingClassIfAbsent: [   
		"Until class will be created the variables does not exist yet" 
		^false ].
	^existingClass 
		slotNamed: name asSymbol 
		ifFound: [true] 
		ifNone: [
			"Until class will be compiled with new slot the new slot does not exist yet"
			false]
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

{ #category : #accessing }
CDSlotNode >> sourceInterval [
	^start to: stop
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
