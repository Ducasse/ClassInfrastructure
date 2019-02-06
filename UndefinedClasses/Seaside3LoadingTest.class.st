Class {
	#name : #Seaside3LoadingTest,
	#superclass : #TestCase,
	#category : #'UndefinedClasses-Experiment'
}

{ #category : #asserting }
Seaside3LoadingTest >> assertAllSeasideTests [
	"self new assertAllSeasideTests"
	| suite results |
	suite := TestSuite new.
	self seasideTestCases do: [ :t | t  addToSuiteFromSelectors: suite ].
	results := suite run.
	self assert: results hasPassed
]

{ #category : #accessing }
Seaside3LoadingTest >> classesToInitialize [ 
	|classesToInitialize|

	classesToInitialize := OrderedCollection new.
	self packagesNames do: [ :packageName |
		|classes|
 		classes := (RPackage organizer packageNamed: packageName) definedClasses collect: [  :c | c  ].
		classesToInitialize addAll: ( classes select: [ : c | c class includesLocalSelector: #initialize ]) 
	].

	^ classesToInitialize
]

{ #category : #actions }
Seaside3LoadingTest >> executeInitializeClassMethodsInCorrectOrder [
	
	self classesToInitialize do: [  : c | c initialize ]
]

{ #category : #'actions-Trials' }
Seaside3LoadingTest >> listOfSeasidePackagesFromSeaside3MetacelloConfiguration [
	"self new listOfSeasidePackagesFromSeaside3MetacelloConfiguration"
	| conf pckagesToLoad |
	
	Metacello new
		smalltalkhubUser: 'Seaside' project: 'MetacelloConfigurations';
		configuration: 'Seaside3';
		get.
	
	conf := (self class environment at: #ConfigurationOfSeaside3)  project version: #stable.
	pckagesToLoad := (conf spec packages packageSpecsInLoadOrderFor: conf spec) select: [ :each |  each isKindOf: MetacelloPackageSpec ].
	
	^ pckagesToLoad "but order complex..."
	"pckagesToLoad do: [ :p | p load ]"
]

{ #category : #actions }
Seaside3LoadingTest >> loadPackageVersion: aString from: url [
	 	 
	Gofer new url: url ; version: aString  ; load
	
	"Gofer new 
		directory: MCCacheRepository default directory absolutePath ;
		version: aString ; 
		load"
]

{ #category : #actions }
Seaside3LoadingTest >> loadSeasidePackagesInRandomOrder [
	|shuffledPackagesToLoad maxNumerOfUndefinedClasses|
	
	maxNumerOfUndefinedClasses := 0.

	"disable some MC stuff before loading"
	MCMethodDefinition initializersEnabled: false.
	
	"load all packages"
	shuffledPackagesToLoad := self seasidePackagesToLoad shuffle.
	shuffledPackagesToLoad do: [ :p |
		[self loadPackageVersion: p name from: p value] on: Warning do: #resume.
		maxNumerOfUndefinedClasses := UndefinedClass allSubclasses size max:  maxNumerOfUndefinedClasses ].
	
	^  maxNumerOfUndefinedClasses
]

{ #category : #accessing }
Seaside3LoadingTest >> packagesNames [

	| packagesNames |
	packagesNames :=  self seasidePackagesToLoad collect: [ :assoc | assoc key ].
	packagesNames := packagesNames collect: [ :k | k copyUpToLast: $- ].
	
	^ packagesNames
]

{ #category : #'actions-Trials' }
Seaside3LoadingTest >> refreshDirtyMCPackages [

	| modifiedMCPackages |
	modifiedMCPackages := MCWorkingCopy registry values select: [  :w | w modified ].
	modifiedMCPackages do: [ :p |
			| patch | 
			patch := p changesRelativeToRepository: MCCacheRepository uniqueInstance.
			(patch notNil and: [ patch isEmpty ]) ifTrue: [ 
		 	p modified: false
			]
		]
]

{ #category : #accessing }
Seaside3LoadingTest >> runCaseManaged [
	"work around the time out mechanism (long running test) "

	^ self runCase
]

{ #category : #accessing }
Seaside3LoadingTest >> seasidePackagesToLoad [
	^ {'Grease-Core-JohanBrichau.97' -> 'http://smalltalkhub.com/mc/Seaside/Grease11/main/'.
'Grease-Pharo30-Core-PavelKrivanek.22' -> 'http://smalltalkhub.com/mc/Seaside/Grease11/main/'.
'Seaside-Pharo40-Continuation-pmm.3' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Grease-Tests-Core-pmm.104' -> 'http://smalltalkhub.com/mc/Seaside/Grease11/main/'.
'Grease-Tests-Pharo20-Core-pmm.13' -> 'http://smalltalkhub.com/mc/Seaside/Grease11/main/'.
'Seaside-Core-JohanBrichau.872' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo20-Core-pmm.6' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Component-pmm.102' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Canvas-pmm.137' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Canvas-pmm.4' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Email-pmm.27' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Email-pmm.21' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Session-pmm.187' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-RenderLoop-pmm.99' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tools-Core-pmm.30' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Tools-Spec-StephanEggermont.25' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Flow-pmm.25' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Flow-lr.5' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Widgets-JohanBrichau.36' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tools-Web-JohanBrichau.129' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo50-Tools-Web-pmm.8' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Development-pmm.166' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Development-TravisCI.96' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Environment-JohanBrichau.85' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Environment-lr.6' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Core-pmm.309' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Pharo40-Core-pmm.4' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Component-pmm.36' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Canvas-pmm.69' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Pharo-Canvas-pmm.1' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Session-pmm.81' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-RenderLoop-JohanBrichau.14' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Environment-pmm.30' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Functional-JohanBrichau.168' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Pharo-Functional-pmm.15' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Flow-pmm.37' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Pharo-Continuation-pmm.9' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Javascript-Core-pmm.99' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Javascript-Pharo20-Core-pmm.6' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Javascript-Tests-Core-JohanBrichau.73' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Javascript-Tests-Pharo-Core-lr.1' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'JQuery-Core-JohanBrichau.139' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Examples-pmm.35' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'JQuery-Tests-Core-pmm.149' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'JQuery-UI-pmm.95' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'JQuery-Tests-UI-pmm.89' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-JSON-Core-pmm.35' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-JSON-Core-JohanBrichau.5' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'JQuery-JSON-JohanBrichau.3' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Welcome-JohanBrichau.50' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Pharo-Welcome-NickAger.2' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Seaside-Tests-Welcome-lr.6' -> 'http://smalltalkhub.com/mc/Seaside/Seaside32/main/'.
'Zodiac-Tests-SvenVanCaekenberghe.18' -> 'http://mc.stfx.eu/Zodiac'.
'Zinc-Character-Encoding-Core-SvenVanCaekenberghe.51' -> 'http://mc.stfx.eu/ZincHTTPComponents'.
'Zinc-Character-Encoding-Tests-SvenVanCaekenberghe.33' -> 'http://mc.stfx.eu/ZincHTTPComponents'.
'Zinc-Resource-Meta-Core-SvenVanCaekenberghe.62' -> 'http://mc.stfx.eu/ZincHTTPComponents'.
'Zinc-HTTP-SvenVanCaekenberghe.461' -> 'http://mc.stfx.eu/ZincHTTPComponents'.
'Zinc-Tests-SvenVanCaekenberghe.239' -> 'http://mc.stfx.eu/ZincHTTPComponents'.
'Zinc-Seaside-JohanBrichau.44' -> 'http://mc.stfx.eu/ZincHTTPComponents' }.
]

{ #category : #accessing }
Seaside3LoadingTest >> seasideTestCases [
	|testClasses|

	testClasses := OrderedCollection new.
	self packagesNames do: [ :packageName |
		|classes|
 		classes := (RPackage organizer packageNamed: packageName) definedClasses collect: [  :c | c  ].
		testClasses addAll: ( classes select: [ : c | (c name beginsWith: 'WA' ) and: [  (c  inheritsFrom: TestCase) and: [ c isAbstract not ] ] ]) 
	].

	^ testClasses
]

{ #category : #tests }
Seaside3LoadingTest >> testLoadingSeasidePackagesInRandomOrder [
	
	| maxNumerOfUndefinedClassesCreated |
	
	self assert:  UndefinedClass allSubclasses isEmpty.

	maxNumerOfUndefinedClassesCreated :=  self loadSeasidePackagesInRandomOrder.
	self assert: maxNumerOfUndefinedClassesCreated > 0.
	Transcript cr; show: 'maxNumerOfUndefinedClassesCreated = ', maxNumerOfUndefinedClassesCreated asString.
	self assert:  UndefinedClass allSubclasses isEmpty.
	
	self flag: 'how to check that no code (method, ...) has been lost by comparing to regular Seaside loading'.
		
	self executeInitializeClassMethodsInCorrectOrder.
	
	self assertAllSeasideTests.
	
]
