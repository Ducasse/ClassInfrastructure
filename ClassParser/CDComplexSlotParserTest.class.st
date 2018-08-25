Class {
	#name : #CDComplexSlotParserTest,
	#superclass : #CDClassParserTest,
	#category : #ClassParser
}

{ #category : #helpers }
CDComplexSlotParserTest >> classDefinitionString [

	^ 'MySuperclass subclass: #MyClass
		slots: \{
		''{instvar1}'' => InstanceVariableSlot. 
		''{instvar2}'' => InstanceVariableSlot.
		\}
		classVariableNames: ''{classvar1} {classvar2}''
		package: #MyPackage'
			format: { 
				'instvar1' -> self firstInstanceVariableName.
				'instvar2' -> self secondInstanceVariableName.
				'classvar1' -> self firstClassVariableName.
				'classvar2' -> self secondClassVariableName. } asDictionary
]
