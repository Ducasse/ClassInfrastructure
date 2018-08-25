Class {
	#name : #CDNode,
	#superclass : #Object,
	#category : #ClassParser
}

{ #category : #'instance-creation' }
CDNode class >> on: aRBMessageNode [ 
	
	^ self new
		definitionExpressionTree: aRBMessageNode;
		yourself
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
CDNode >> bestNodeForOld: aSelection [
	
	| originalNodeSelected selectedClassDefinitionNode |
	originalNodeSelected := definitionExpressionTree bestNodeFor: aSelection.
	selectedClassDefinitionNode := classDefinitionNodes at: originalNodeSelected.
	^ selectedClassDefinitionNode
]

{ #category : #selection }
CDNode >> children [

	self subclassResponsibility
]

{ #category : #selection }
CDNode >> containedBy: anInterval [ 
	^anInterval first <= self start and: [anInterval last >= self stop]
]

{ #category : #selection }
CDNode >> intersectsInterval: anInterval [ 
	^(anInterval first between: self start and: self stop) 
		or: [self start between: anInterval first and: anInterval last]
]

{ #category : #selection }
CDNode >> start [
	
	^ self subclassResponsibility
]

{ #category : #selection }
CDNode >> stop [
	
	^ self subclassResponsibility
]
