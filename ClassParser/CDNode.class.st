Class {
	#name : #CDNode,
	#superclass : #Object,
	#instVars : [
		'originalNode',
		'children'
	],
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDNode class >> on: aRBMessageNode [ 
	
	^ self new
		definitionExpressionTree: aRBMessageNode;
		yourself
]

{ #category : #compatibility }
CDNode >> ast [

	^ self
]

{ #category : #selection }
CDNode >> bestNodeFor: anInterval [ 
	| selectedChildren |
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	selectedChildren := self children 
				select: [:each | each intersectsInterval: anInterval].
	^selectedChildren size == 1 
		ifTrue: [selectedChildren first bestNodeFor: anInterval]
		ifFalse: [self]
]

{ #category : #selection }
CDNode >> children [

	^ children
]

{ #category : #selection }
CDNode >> containedBy: anInterval [ 
	^anInterval first <= self start and: [anInterval last >= self stop]
]

{ #category : #compatibility }
CDNode >> hasBreakpoint [
	
	^ false
]

{ #category : #compatibility }
CDNode >> hasExecutionCounter [
	
	^ false
]

{ #category : #compatibility }
CDNode >> hasWatchpoint [
	
	^ false
]

{ #category : #initialization }
CDNode >> initialize [

	super initialize.
	children := OrderedCollection new
]

{ #category : #selection }
CDNode >> intersectsInterval: anInterval [ 
	^(anInterval first between: self start and: self stop) 
		or: [self start between: anInterval first and: anInterval last]
]

{ #category : #accessing }
CDNode >> originalNode: aNode [

	originalNode := aNode
]

{ #category : #suggestions }
CDNode >> specialCommands [
	
	self subclassResponsibility
]

{ #category : #selection }
CDNode >> start [
	
	^ originalNode start
]

{ #category : #selection }
CDNode >> stop [
	
	^ originalNode stop
]

{ #category : #suggestions }
CDNode >> suggestions [
	
	^ SugsSuggestionFactory globalCommands
		addAll: self specialCommands;
		yourself 
]
