Class {
	#name : #MygGalaBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#classVars : [
		'Icons'
	],
	#category : #'game_pharo'
}

{ #category : #accessing }
MygGalaBoxElement >> box: aSkElement [

	box := aSkElement.
]
