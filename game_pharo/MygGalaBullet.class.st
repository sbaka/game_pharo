Class {
	#name : #MygGalaBullet,
	#superclass : #MygGalagaMovable,
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
MygGalaBullet >> bringIn: aPlayer going: aDirection [

	| boxPreviousPosition neighbor didMove |
	aPlayer class = self class ifTrue: [ ^ false ].
	boxPreviousPosition := self position.
	"we store the current position because if I can move, I will have to move the player to my old position."
	neighbor := self board atPosition: aDirection * self position.
	"First I tried to move in by asking my neighbor"
	didMove := self moveIn: neighbor going: aDirection.
	"If I moved them moved the player to move into my previous position"
	didMove ifTrue: [
		| playerPreviousPosition |
		playerPreviousPosition := aPlayer position.
		aPlayer basicPosition: boxPreviousPosition.
		self board updatePositionOf: aPlayer from: playerPreviousPosition ].
	^ didMove
]

{ #category : #'as yet unclassified' }
MygGalaBullet >> fireBullet [

	^ self move: CpDirection north
]

{ #category : #initialization }
MygGalaBullet >> initialize [ 

	super initialize.
]

{ #category : #testing }
MygGalaBullet >> isBullet [ 
	^ true
]
