Class {
	#name : #MygGalagaMovable,
	#superclass : #MygSkElement,
	#instVars : [
		'background'
	],
	#category : #'game_pharo'
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

	^ MygGalaGround new
]

{ #category : #accessing }
MygGalagaMovable >> move: aCpDirection [
"ajouté edem"
	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #accessing }
MygGalagaMovable >> moveEast [
"ajouté edem"
	^ self move: CpDirection east
]

{ #category : #accessing }
MygGalagaMovable >> moveWest [
"ajouté edem"
	^ self move: CpDirection west
]

{ #category : #accessing }
MygGalagaMovable >> position: aPoint [
"ajouté edem"
	position := aPoint.
	self background position: aPoint
]
