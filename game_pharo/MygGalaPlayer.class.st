Class {
	#name : #MygGalaPlayer,
	#superclass : #MygGalagaMovable,
	#instVars : [
		'facing'
	],
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
MygGalaPlayer >> backgroundRepresentation [
"ajouté edem"
	| dict |
	dict := {
		        (CpWestDirection -> MygSkBoxElement playerLeftIcon).
		        (CpEastDirection -> MygSkBoxElement playerRightIcon) } asDictionary.
	^ dict at: self facing
]

{ #category : #accessing }
MygGalaPlayer >> facing [ 

	^ facing.
]

{ #category : #accessing }
MygGalaPlayer >> facing: aCpDirection [
	
	facing := aCpDirection.
]

{ #category : #accessing }
MygGalaPlayer >> initialize [ 

	super initialize.
	facing :=CpWestDirection.
]

{ #category : #accessing }
MygGalaPlayer >> isPlayer [ 
	^ true
]

{ #category : #accessing }
MygGalaPlayer >> move: aCpDirection [
"ajouté edem"
	self facing: aCpDirection class.
	^ super move: aCpDirection
]
