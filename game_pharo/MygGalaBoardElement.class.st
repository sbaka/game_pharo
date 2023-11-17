Class {
	#name : #MygGalaBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'game_pharo'
}

{ #category : #'as yet unclassified' }
MygGalaBoardElement class >> openWithModel: aBoardModel [
	self new openWithModel: aBoardModel 
]

{ #category : #accessing }
MygGalaBoardElement >> board: aSkBoard [

	board := aSkBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ]
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> openWithModel: aSkBoard [

	| space |
	space := BlSpace new.
	space pulse
		extent: 1000 @ 1000;
		resizable: true.
	space root addChild: self.
	self board: aSkBoard.

	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space show
]
