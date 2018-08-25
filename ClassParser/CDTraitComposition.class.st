Class {
	#name : #CDTraitComposition,
	#superclass : #CDNode,
	#category : #ClassParser
}

{ #category : #testing }
CDTraitComposition >> isTraitComposition [
	
	^ true
]

{ #category : #selection }
CDTraitComposition >> start [
	
	^ originalNode start
]

{ #category : #selection }
CDTraitComposition >> stop [
	
	^ originalNode stop
]
