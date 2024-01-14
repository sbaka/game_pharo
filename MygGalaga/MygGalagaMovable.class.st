Class {
	#name : #MygGalagaMovable,
	#superclass : #MygGalaElement,
	#instVars : [
		'background'
	],
	#category : #MygGalaga
}

{ #category : #accessing }
MygGalagaMovable >> background [

	^ background
]

{ #category : #accessing }
MygGalagaMovable >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygGalagaMovable >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #accessing }
MygGalagaMovable >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #accessing }
MygGalagaMovable >> defaultBackground [

	^ MygGalaGround  new
]

{ #category : #accessing }
MygGalagaMovable >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #accessing }
MygGalagaMovable >> moveEast [

	^ self move: CpDirection east
]

{ #category : #move }
MygGalagaMovable >> moveNorth [

	^ self move: CpDirection north
]

{ #category : #accessing }
MygGalagaMovable >> moveWest [

	^ self move: CpDirection west
]

{ #category : #accessing }
MygGalagaMovable >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
