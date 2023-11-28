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
^ MygGalaBoxElement spaceShipIcon.
]

{ #category : #accessing }
MygGalaPlayer >> facing [ 

	^ facing
]

{ #category : #accessing }
MygGalaPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #initialization }
MygGalaPlayer >> initialize [ 

	super initialize.
	facing := CpEastDirection
]

{ #category : #initialization }
MygGalaPlayer >> isPlayer [ 
	^ true
]

{ #category : #initialization }
MygGalaPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]
