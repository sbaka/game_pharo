Class {
	#name : #BaselineOfGalaga,
	#superclass : #BaselineOf,
	#category : #BaselineOfGalaga
}

{ #category : #baselines }
BaselineOfGalaga >> baseline: spec [
	<baseline>

	spec
		baseline: 'Myg'
		with: [ spec repository: 'github://Ducasse/Myg:v1.0.1/src' ].

	spec

		package: 'MyGalaga' 
		with: [ spec requires: #( 'Myg' ) ];
		package: 'MyGalaga-Tests'
		with: [ spec requires: #( 'MyGalaga' ) ];
		yourself
]
