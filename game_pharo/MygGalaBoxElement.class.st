Class {
	#name : #MygGalaBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#classVars : [
		'Icons'
	],
	#category : #'game_pharo'
}

{ #category : #'as yet unclassified' }
MygGalaBoxElement >> backgroundPaint [
 	"Rajoute un oouleur transparent car une box va comporter l'image des elements (utilisé dans initialize" 
	^ Color transparent
]

{ #category : #accessing }
MygGalaBoxElement >> board [ 
	^ board 
]

{ #category : #accessing }
MygGalaBoxElement >> board: aSkBoard [

	board := aSkBoard.

	self
		constraintsDo: [ :c | c horizontal matchParent ]
]

{ #category : #accessing }
MygGalaBoxElement >> box [ 
	^ box 
]

{ #category : #accessing }
MygGalaBoxElement >> box: aSkElement [

	box := aSkElement.
]

{ #category : #'as yet unclassified' }
MygGalaBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new
]

{ #category : #'as yet unclassified' }
MygGalaBoxElement >> positionInField [

	^ positionInField
]

{ #category : #'as yet unclassified' }
MygGalaBoxElement >> positionInField: aPoint [

	positionInField := aPoint
]

{ #category : #'as yet unclassified' }
MygGalaBoxElement >> updateBackgroundColor [

	| bg |
	bg := self box backgroundRepresentation.
	bg class = Form ifTrue: [
		| size boardElement space |
		
		boardElement := self parent parent parent.
		space := boardElement space.
		size := space extent / boardElement board width
		        - boardElement firstChild layout cellSpacing.
		bg := bg scaledIntoFormOfSize: size ].
	self background: bg
]
