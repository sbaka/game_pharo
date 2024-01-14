Class {
	#name : #MygGalaBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'bullet',
		'setPlayer',
		'gameManager',
		'ended'
	],
	#category : #MygGalaga
}

{ #category : #initialization }
MygGalaBoard class >> createWithBoard: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : #'as yet unclassified' }
MygGalaBoard class >> createWithBoard: aCTNewArray2D managedBy: aSkGameManager [

	^ (self createWithBoard: aCTNewArray2D)
		  gameManager: aSkGameManager;
		  yourself
]

{ #category : #'as yet unclassified' }
MygGalaBoard class >> importFromString: aString [

	| tmp |
	tmp := MygLevelImporter fromString: aString fromPackage: self package.
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #'public api - configure' }
MygGalaBoard >> asciiString [

	^ String streamContents: [ :st | self printOn: st ]
]

{ #category : #'public api - configure' }
MygGalaBoard >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #'public api - configure' }
MygGalaBoard >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #'public api - configure' }
MygGalaBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #'public api - configure' }
MygGalaBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #'public api - configure' }
MygGalaBoard >> atPosition: aCpPositionable [

	^ grid at: aCpPositionable x @ aCpPositionable y
]

{ #category : #accessing }
MygGalaBoard >> bullet [

	^ bullet
]

{ #category : #accessing }
MygGalaBoard >> bullet: anBullet [

	^ bullet := anBullet
]

{ #category : #'public api - configure' }
MygGalaBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setBullet;
		setPlayer
]

{ #category : #enumerating }
MygGalaBoard >> do: aBlock [

	grid do: aBlock
]

{ #category : #'public api - configure' }
MygGalaBoard >> ended [

	^ ended
]

{ #category : #'public api - configure' }
MygGalaBoard >> gameManager [

	^ gameManager
]

{ #category : #'public api - configure' }
MygGalaBoard >> gameManager: aGalaGameManager [

	gameManager := aGalaGameManager
]

{ #category : #'public api - configure' }
MygGalaBoard >> initialize [

	super initialize.
	ended := false
]

{ #category : #'public api - configure' }
MygGalaBoard >> moveSteps: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #'public api - configure' }
MygGalaBoard >> player [

	^ player
]

{ #category : #'public api - configure' }
MygGalaBoard >> reset [

	self gameManager launchAgain
]

{ #category : #'public api - configure' }
MygGalaBoard >> setBullet [

	bullet := grid contents detect: #isBullet
]

{ #category : #'public api - configure' }
MygGalaBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : #'public api - configure' }
MygGalaBoard >> updatePositionOf: aGalagaMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aGalagaMovable background.
	"put the current position element as previous background of the moving element."
	aGalagaMovable background: (self
			 atColumn: aGalagaMovable position x
			 atRow: aGalagaMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aGalagaMovable position x
		atRow: aGalagaMovable position y
		put: aGalagaMovable
]

{ #category : #accessing }
MygGalaBoard >> width [

	^ grid width
]
