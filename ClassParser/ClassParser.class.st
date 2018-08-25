"
I generate a tree of objects representing the definition of a class. 
I'm not a single object because I want to follow the design of an AST with the positions and the rest. 

I can be parametrized by providing a binding lists (name * other nodes) so that I can link to previously created entities instead of blindly creating new ones. 

For example class definition should support smart suggestions. 
"
Class {
	#name : #ClassParser,
	#superclass : #Object,
	#instVars : [
		'definition',
		'bindings'
	],
	#category : #ClassParser
}

{ #category : #accessing }
ClassParser >> bindings [
	"define the previously created entities that the new class should refer to instead of creating new entities."
	^ bindings 
]

{ #category : #accessing }
ClassParser >> bindings: aDict [
	"define the previously created entities that the new class should refer to instead of creating new entities."
	bindings := aDict
]

{ #category : #accessing }
ClassParser >> definition [

	^ definition ifNil: [ definition := ClassDefinitionNode new ]
]

{ #category : #parsing }
ClassParser >> ensurePackageEntityFrom: packageName [

	^ self bindings 
		at: packageName 
		ifAbsent: [ PackageDefinitionNode new name: packageName ]
]

{ #category : #parsing }
ClassParser >> handleInstanceVariables: variables [
	variables
		do: [ :each | 
			self definition
				addVariable:
					(InstanceVariableDefinition new
						name: each;
						parent: self) ]
]

{ #category : #parsing }
ClassParser >> handlePackage: packageName [
	self definition package: (self ensurePackageEntityFrom: packageName)
]

{ #category : #initialization }
ClassParser >> initialize [

	super initialize.
	bindings := IdentityDictionary new
]

{ #category : #parsing }
ClassParser >> parse: aString [
	| tokens |
	tokens := Parser new scanTokens: aString.
	self definition superclassName: tokens first.
	self definition name: tokens third.
	self definition selectorParts: tokens selectEverySecond.
	self handlePackage: tokens last.
	self handleInstanceVariables: 	((tokens at: 5)findTokens: Character space)
]
