Class {
	#name : #MygGalaBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'monsters',
		'redMonsters',
		'blueMonsters',
		'bullet',
		'setPlayer',
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

{ #category : #'public api - configure' }
MygGalaBoard >> asciiString [ 

	^ String streamContents: [ :st |
		self printOn: st ]	
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
	^ (grid at: aCpPositionable x @ aCpPositionable y)
]

{ #category : #accessing }
MygGalaBoard >> blueMonsters [
	^ blueMonsters 
]

{ #category : #accessing }
MygGalaBoard >> blueMonsters: aBlueMonster [
	^ blueMonsters  := aBlueMonster
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
		setBlueMonster;
		setRedMonster;
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

{ #category : #accessing }
MygGalaBoard >> ended: aBoolean [

	ended := aBoolean
]

{ #category : #'public api - configure' }
MygGalaBoard >> gameManager [ 
	
	^ gameManager 
]

{ #category : #'public api - configure' }
MygGalaBoard >> gameManager: aGalaGameManager [

	gameManager:= aGalaGameManager 
]

{ #category : #'public api - configure' }
MygGalaBoard >> initialize [
	super initialize.
	ended := false.
	monsters := OrderedCollection new.	
	redMonsters  := OrderedCollection new.
	blueMonsters  := OrderedCollection new.
]

{ #category : #accessing }
MygGalaBoard >> monsters [
	^ monsters 
]

{ #category : #accessing }
MygGalaBoard >> monsters: aMonster [
	^ monsters  := aMonster
]

{ #category : #'public api - configure' }
MygGalaBoard >> moveSteps: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #'public api - configure' }
MygGalaBoard >> player [
	^ player
]

{ #category : #accessing }
MygGalaBoard >> redMonsters [
	^ redMonsters 
]

{ #category : #accessing }
MygGalaBoard >> redMonsters: aRedMonster [
	^ redMonsters  := aRedMonster
]

{ #category : #'public api - configure' }
MygGalaBoard >> reset [

	self gameManager launchAgain
]

{ #category : #'public api - configure' }
MygGalaBoard >> setBlueMonster [

	blueMonsters := grid contents select: #isBlueMonster
]

{ #category : #'public api - configure' }
MygGalaBoard >> setBullet [

	bullet := grid contents detect: #isBullet
]

{ #category : #'public api - configure' }
MygGalaBoard >> setMonster [

	monsters := grid contents select: #isMonster
]

{ #category : #'public api - configure' }
MygGalaBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : #'public api - configure' }
MygGalaBoard >> setRedMonster [

	redMonsters := grid contents select: #isRedMonster
]

{ #category : #'public api - configure' }
MygGalaBoard >> updatePositionOf: aGalagaMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aGalagaMovable background.
	"put the current position element as previous background of the moving element."
	aGalagaMovable background:
		(self atColumn: aGalagaMovable position x atRow: aGalagaMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aGalagaMovable position x
		atRow: aGalagaMovable position y
		put: aGalagaMovable.
	
]

{ #category : #accessing }
MygGalaBoard >> width [
	^ grid width
]
