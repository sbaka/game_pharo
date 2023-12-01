Class {
	#name : #MygGalaBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict',
		'modify'
	],
	#category : #'game_pharo'
}

{ #category : #'as yet unclassified' }
MygGalaBoardElement class >> openWithModel: aGalaBoard [

	self new openWithModel: aGalaBoard
]

{ #category : #initialization }
MygGalaBoardElement >> backgroundLayer [ 

	^ backgroundLayer
]

{ #category : #initialization }
MygGalaBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
]

{ #category : #initialization }
MygGalaBoardElement >> board [

	^ board
]

{ #category : #accessing }
MygGalaBoardElement >> board: aGalaBoard [

	board := aGalaBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayer;
		initializeForegroundLayer
]

{ #category : #initialization }
MygGalaBoardElement >> boardPreview: aGalaBoard [

	board := aGalaBoard.
	self loseFocus.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayerPreview;
		initializeForegroundLayerPreview.
	board := nil
]

{ #category : #initialization }
MygGalaBoardElement >> directionDict [

	^ directionDict
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childNamed: aPoint asString) firstChild.
	neighborElement := (layer childNamed:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygGalaWall ifFalse: [
		nextNeighborElement := (layer childNamed:
			                       (aCpDirection * (aCpDirection * aPoint))
				                       asString) firstChild.
		elements add: nextNeighborElement ].
	^ elements
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> foregroundLayer [

	^ foregroundLayer
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> foregroundLayer: aBlElement [

	foregroundLayer := aBlElement 
]

{ #category : #initialization }
MygGalaBoardElement >> initialize [

	super initialize.
	self initializeDirectionDict.
	self
		background: (BlBackground paint: Color veryLightGray);
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvent: anEvent ];
		requestFocus
]

{ #category : #initialization }
MygGalaBoardElement >> initializeBackgroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: 10;
				          cellSpacing: 0);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		
		boxElement := (MygGalaBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #initialization }
MygGalaBoardElement >> initializeBackgroundLayerPreview [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (MygSkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			             clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #initialization }
MygGalaBoardElement >> initializeDirectionDict [

	directionDict := {
		        "(#DOWN -> CpDirection south)."
		        "(#UP -> CpDirection north)."
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
]

{ #category : #initialization }
MygGalaBoardElement >> initializeForegroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: 10;
				          cellSpacing: 0);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		
		tmpBox := aBox.
		
		boxElement := (MygGalaBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #initialization }
MygGalaBoardElement >> initializeForegroundLayerPreview [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygGalagaMovable ) ifFalse: [
			tmpBox := MygGalaGround  new ].
		boxElement := (MygGalaBoxElement  box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			             clipChildren: false.

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> manageEvent: anEvent [

	| player bullet moved movedBullet direction neighborElement elements |
	
	player := self board player.
	bullet := self board bullet.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].
	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	moved := player move: direction.
	 	

	"anEvent key name = #SPACE ifTrue: [
		self resetBoard.
		^ self ]."
	anEvent key name = #ESCAPE ifTrue: [
		self space close.
		^ self ].
	anEvent key name = #SPACE ifTrue: [
		self board bullet move: CpDirection north.
		"self board bullet fireBullet."
		^ self ].
	"board isFinished ifTrue: [ ^ self ]."
		
	player backgroundRepresentation.

	neighborElement := elements second.

	(moved  and: [ neighborElement box class = MygGalaBoxElement ])
		ifTrue: [
			| animation |
			animation := neighborElement boxAnimationMovingInDirection:
				             direction.
			neighborElement addAnimation: (animation onFinishedDo: [
					 neighborElement resetAnimation.
					 self updateElements: elements ]) ]
		ifFalse: [ self updateElements: elements ]
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> moveGalaSpaceShip: aSpaceShip direction: anEvt [ 
|direction elements moved neighborElement| 
2 timesRepeat: [     "Assuming 'move' is a method in your Player class that updates its position"   direction := self directionDict                      
at: anEvt key name                      
ifAbsent: [ ^ self ].     
elements := self                     
elementsToUpdateAtPosition: aSpaceShip position  
goingIn: direction.     
moved := aSpaceShip move: direction.
neighborElement := elements second.    
moved ifTrue: [self updateElements: elements ]. 
  (Delay forSeconds: 0.1) wait.].
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> openWithModel: aGalaBoard [

	| space |
	space := BlSpace new.
	space pulse
		extent: 1000 @ 1000;
		resizable: true.
	space root addChild: self.
	self board: aGalaBoard.

	space root background: Color blue muchLighter.
	space root layout: BlFrameLayout new.
	space show
]

{ #category : #initialization }
MygGalaBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
