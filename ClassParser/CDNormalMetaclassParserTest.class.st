Class {
	#name : #CDNormalMetaclassParserTest,
	#superclass : #CDBehaviorParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDNormalMetaclassParserTest >> classDefinitionString [
	
	^ '{className} class 
		instanceVariableNames: ''{instvar1} {instvar2}'''
			format: { 
				'className' -> self className.	
				'instvar1' -> self firstInstanceVariableName.
				'instvar2' -> self secondInstanceVariableName.
			 } asDictionary
]

{ #category : #introspection }
CDNormalMetaclassParserTest >> className [
	"Answer a string characterizing the receiver's class, for use in list views for example"

	^ self class name asString
]

{ #category : #running }
CDNormalMetaclassParserTest >> setUp [
]
