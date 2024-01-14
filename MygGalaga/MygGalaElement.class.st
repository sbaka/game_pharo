Class {
	#name : #MygGalaElement,
	#superclass : #MygAbstractBox,
	#category : #MygGalaga
}

{ #category : #initialization }
MygGalaElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
MygGalaElement class >> textualMapCharacter [

	^ $Z
]

{ #category : #initialization }
MygGalaElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #initialization }
MygGalaElement >> bringIn: aGalagaMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."

	| previousPosition |
	previousPosition := aGalagaMovable position.
	aGalagaMovable  basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aGalagaMovable  from: previousPosition.
	^ true
]

{ #category : #initialization }
MygGalaElement >> configureBoard: aBoard [

	self board: aBoard.
	
]

{ #category : #initialization }
MygGalaElement >> configured [ 

	^self
]

{ #category : #initialization }
MygGalaElement >> isBullet [
	^ false
]

{ #category : #initialization }
MygGalaElement >> isPlayer [
	^ false
]

{ #category : #initialization }
MygGalaElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #initialization }
MygGalaElement >> postCreationAction [

	self
]

{ #category : #initialization }
MygGalaElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]
