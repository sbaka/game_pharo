Class {
	#name : #MygGalaBullet,
	#superclass : #MygGalagaMovable,
	#instVars : [
		'facing'
	],
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaBullet class >> textualMapCharacter [

	^ $h
]

{ #category : #accessing }
MygGalaBullet >> backgroundRepresentation [

	^ MygGalaBoxElement bulletIcon 
]

{ #category : #initialization }
MygGalaBullet >> initialize [ 

	super initialize.
]

{ #category : #testing }
MygGalaBullet >> isBullet [ 
	^ true
]
