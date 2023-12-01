Class {
	#name : #GalgaManager,
	#superclass : #Object,
	#instVars : [
		'currentBoardElement',
		'currentMoveCount',
		'menu'
	],
	#category : #'game_pharo'
}

{ #category : #'as yet unclassified' }
GalgaManager class >> importFromString: aString [

	| tmp |
	tmp := MygLevelImporter fromString: aString fromPackage: MygGalaBoard package.
	tmp := tmp collect: [ :each | each configured ].
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #accessing }
GalgaManager >> currentBoardElement [

	^ currentBoardElement
]

{ #category : #accessing }
GalgaManager >> currentBoardElement: aGalaBoardElement [
	currentBoardElement := aGalaBoardElement 
]

{ #category : #accessing }
GalgaManager >> currentMoveCount [ 
	
	^ currentMoveCount 
]

{ #category : #accessing }
GalgaManager >> currentMoveCount: aNumber [

	currentMoveCount:= aNumber 
]

{ #category : #accessing }
GalgaManager >> initialize [

	super initialize.
	currentMoveCount := 0.
]

{ #category : #private }
GalgaManager >> launch [

	| board |
	self currentBoardElement: MygGalaBoardElement new.
	board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '#m      m#
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			           fromPackage: MygGalaBoard  package) do: [ :each |
			          each configured ]).
	self currentBoardElement openWithModel: board
]

{ #category : #accessing }
GalgaManager >> menu [ 

	^ menu
]

{ #category : #accessing }
GalgaManager >> menu: aToMenu [

	menu := aToMenu
]
