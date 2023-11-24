Class {
	#name : #GalgaManager,
	#superclass : #Object,
	#instVars : [
		'currentBoardElement'
	],
	#category : #'game_pharo'
}

{ #category : #'as yet unclassified' }
GalgaManager class >> importFromString: aString [

	| tmp|
	tmp := MygLevelImporter fromString: aString fromPackage: MygSkBoard package.
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

{ #category : #private }
GalgaManager >> launch [

	| board |
	self currentBoardElement: MygGalaBoardElement new.
	board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '                  '
			           fromPackage: MygGalaBoard  package) do: [ :each |
			          each configured ]).
	self currentBoardElement openWithModel: board
]
