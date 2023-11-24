Class {
	#name : #MygGalaBoard,
	#superclass : #MygBoard,
	#category : #'game_pharo'
}

{ #category : #initialization }
MygGalaBoard class >> createWithBoard: array [

	^ self new 
	
		configureGrid: array; 
		yourself 
]

{ #category : #'public api - configure' }
MygGalaBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
]
