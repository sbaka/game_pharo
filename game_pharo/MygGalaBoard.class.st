Class {
	#name : #MygGalaBoard,
	#superclass : #MygBoard,
	#instVars : [
		'boxes',
		'player',
		'gameManager',
		'ended'
	],
	#category : #'game_pharo'
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
	|tmp|
	tmp := MygLevelImporter fromString: aString fromPackage: self package.
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #accessing }
MygGalaBoard >> at: anInteger at: anInteger2 [
"ajouté edem"
	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
MygGalaBoard >> at: anInteger at: anInteger2 put: anElement [
"ajouté edem"
	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
MygGalaBoard >> atColumn: anInteger atRow: anInteger2 [
"ajouté edem"
	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
MygGalaBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [
"ajouté edem"
	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
MygGalaBoard >> atPosition: aCpPositionable [ 
	^ (grid at: aCpPositionable x @ aCpPositionable y)
	"ajouté edem"
]

{ #category : #accessing }
MygGalaBoard >> configureGrid: aCTNewArray2D [
"ajouté edem"
	super configureGrid: aCTNewArray2D.
	self
		setPlayer
]

{ #category : #accessing }
MygGalaBoard >> do: aBlock [
"ajouté edem"
	grid do: aBlock
]

{ #category : #accessing }
MygGalaBoard >> endGame [

	ended ifTrue: [ ^ self ].
	ended := true.
	gameManager ifNotNil: [ gameManager registerLevel ]
]

{ #category : #accessing }
MygGalaBoard >> ended [ 

	^ ended
]

{ #category : #accessing }
MygGalaBoard >> gameManager [ 
	"ajouté edem"
	^ gameManager 
]

{ #category : #accessing }
MygGalaBoard >> gameManager: aSkGameManager [
"ajouté edem"
	gameManager:= aSkGameManager 
]

{ #category : #accessing }
MygGalaBoard >> initialize [
"ajouté edem"
	super initialize.
	ended := false.
]

{ #category : #testing }
MygGalaBoard >> isFinished [
	^ boxes allSatisfy: [ :each | each background isTarget ]
	"ajouté edem"
]

{ #category : #testing }
MygGalaBoard >> isFinishedmoveSteps: aCollectionOfDirection [
"ajouté edem"
	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #accessing }
MygGalaBoard >> moveSteps: aCollectionOfDirection [
"ajouté edem"
	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #testing }
MygGalaBoard >> player [
	^ player
	"ajouté edem"
]

{ #category : #accessing }
MygGalaBoard >> setPlayer [
"ajouté edem"
	player := grid contents detect: #isPlayer
]

{ #category : #accessing }
MygGalaBoard >> updatePositionOf: aSkMovable from: previousPosition [
	"Put back the previous position element."
"ajouté edem"
	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aSkMovable background.
	"put the current position element as previous background of the moving element."
	aSkMovable background:
		(self atColumn: aSkMovable position x atRow: aSkMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aSkMovable position x
		atRow: aSkMovable position y
		put: aSkMovable.
	self isFinished ifTrue: [ self endGame ]
]

{ #category : #accessing }
MygGalaBoard >> width [
	^ grid width
]
