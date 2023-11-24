Class {
	#name : #MygGalaBoard,
	#superclass : #MygBoard,
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
MygGalaBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
]
