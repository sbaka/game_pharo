Class {
	#name : #MygGalaBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict',
		'modify',
		'score'
	],
	#category : #MygGalaga
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

	| layer elements movableElement neighborElement "nextNeighborElement" |
	layer := self foregroundLayer.
	movableElement := (layer childWithId: aPoint asString) firstChild.
	neighborElement := (layer childWithId:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            movableElement.
		            neighborElement } asOrderedCollection.
	"(neighborElement board grid at: neighborElement positionInField)
		class = MygGalaWall ifFalse: [
		nextNeighborElement := (layer childWithId:
			                        (aCpDirection * (aCpDirection * aPoint))
				                        asString) firstChild.
		elements add: nextNeighborElement ]."
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
		background: (BlBackground paint: Color black);
		layout: BlFrameLayout new;
		constraintsDo: [ :c | c vertical matchParent ];
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
		         layout: (BlGridLayout horizontal columnCount: board width);
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
		                 (#LEFT -> CpDirection west).
		                 (#RIGHT -> CpDirection east) } asDictionary
	"(#DOWN -> CpDirection south)."
	"(#UP -> CpDirection north)."
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
		         layout: (BlGridLayout horizontal columnCount: board width);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygGalagaMovable) ifFalse: [
			tmpBox := MygGalaGround new ].
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

{ #category : #event }
MygGalaBoardElement >> manageEvent: anEvent [

	| player bullet moved direction neighborElement elements bulletposition scoreElementInit space|
	
	bullet := self board bullet.
	bulletposition := bullet position.
	"Ici on bouge la balle vers le haut"
	anEvent key name = #SPACE ifTrue: [
		| fired movingBulletProcess|
		bullet isFired: true.
		fired:= true.
		movingBulletProcess :=[|count|
		count :=0.
		[fired and: count <= 8 ] whileTrue: [
			self moveBullet.
			((board atColumn: bullet position x atRow:  bullet position y + 1) isKindOf: MygGalaMonster) ifTrue: [score := score + 100].
			self updateScoreElement.
			"Transcript show: ((board atColumn: bullet position x atRow:  bullet position y + 1) isKindOf: MygGalaMonster) ."
			count:= count + 1.
			(Delay forMilliseconds: 400) wait.
		 ].
	] fork.
		^ self ].

	player := self board player.

	anEvent key name = #ESCAPE ifTrue: [ ^ self space close ].

	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].

	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.

	moved := player move: direction.
	self resetBulletPosition: bullet player: player.
	neighborElement := elements second.
	(moved and: [ neighborElement box class = MygGalaBoxElement ])
		ifTrue: [
			| animation |
			animation := neighborElement boxAnimationMovingInDirection:
				             direction.
			neighborElement addAnimation: (animation onFinishedDo: [
					 neighborElement resetAnimation.
					 self updateElements: elements ]) ]
		ifFalse: [ self updateElements: elements ]
]

{ #category : #initialization }
MygGalaBoardElement >> moveBullet [

	| player bullet bulletNeighborhood bulletElements fired bulletPosition |
	bullet := self board bullet.
	player := self board player.
	bulletPosition := bullet position.
	bulletElements := self
		                  elementsToUpdateAtPosition: bullet position
		                  goingIn: CpDirection north.
	fired := bullet move: CpDirection north.

	fired ifFalse: [
		self resetBulletPosition: bullet player: player.
		self updateElements: bulletElements.
		^ self ].

	bulletNeighborhood := bulletElements second.
	bulletNeighborhood class = MygGalaMonster
		ifTrue: [
			| ground |
			ground := MygGalaGround new.
			ground board: bullet board.
			ground position: bulletPosition.
			self board
				atColumn: bulletNeighborhood position x
				atRow: bulletNeighborhood position y
				put: ground.
			self updateElements: bulletElements.
			^ self ]
		ifFalse: [ self updateElements: bulletElements ]
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

	| space scoreElement btnContainer|
	
	space := BlSpace new.
	space pulse
		extent: 1000 @ 1000;
		resizable: true.
	space root addChild: self.
	
	self score: 0. 
	self board: aGalaBoard.
	
	scoreElement:= (BlTextElement new
				             text: (self score asRopedText
						              fontName: 'Phosphate';
						              fontSize: 24);
				             background: Color green).
	
		
	btnContainer := BlElement new
		                layout: BlLinearLayout vertical;
		                constraintsDo: [ :c |
			                c horizontal matchParent.
			                c vertical fitContent.
			                c frame vertical alignBottom ].
	
	btnContainer addChildren: {
			scoreElement. }.
			
	"space represents the window itself"
	space root addChild: btnContainer.

	space root background: Color blue muchLighter.
	space root layout: BlFrameLayout new.
	space show
]

{ #category : #initialization }
MygGalaBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #initialization }
MygGalaBoardElement >> resetBulletPosition: bullet player: player [

	| bulletPosition ground |
	bulletPosition := bullet position.
	bullet position: CpDirection north * player position.
	bullet isFired: false.

	ground := MygGalaGround new.
	ground board: bullet board.
	ground position: bulletPosition.
	self board
		atColumn: bulletPosition x
		atRow: bulletPosition y
		put: ground
]

{ #category : #initialization }
MygGalaBoardElement >> score [

	^ score
]

{ #category : #initialization }
MygGalaBoardElement >> score: anInteger [

	score := anInteger
]

{ #category : #'as yet unclassified' }
MygGalaBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]

{ #category : #initialization }
MygGalaBoardElement >> updateScoreElement [

	| space |
	space := (self parent childAt: 2) childAt: 1.
	space
		text: (self score asRopedText
				 fontName: 'Phosphate';
				 fontSize: 24);
		background: Color green
]
