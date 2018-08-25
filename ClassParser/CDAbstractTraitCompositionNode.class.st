Class {
	#name : #CDAbstractTraitCompositionNode,
	#superclass : #CDNode,
	#category : #'ClassParser-Model'
}

{ #category : #composing }
CDAbstractTraitCompositionNode >> + aNode [
	
	^ CDTraitCompositionSequenceNode new
		sequence: { self . aNode }
]

{ #category : #combining }
CDAbstractTraitCompositionNode >> - aCollection [ 
	
	^ CDTraitExclusionNode new
		subject: self;
		exclusions: aCollection
]

{ #category : #composing }
CDAbstractTraitCompositionNode >> @ aCollection [ 
	
	^ CDTraitAliasNode new
		subject: self;
		aliases: aCollection
]

{ #category : #testing }
CDAbstractTraitCompositionNode >> isTraitComposition [
	
	^ true
]

{ #category : #selection }
CDAbstractTraitCompositionNode >> start [
	
	^ originalNode start
]

{ #category : #selection }
CDAbstractTraitCompositionNode >> stop [
	
	^ originalNode stop
]
