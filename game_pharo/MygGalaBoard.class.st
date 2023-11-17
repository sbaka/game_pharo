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
