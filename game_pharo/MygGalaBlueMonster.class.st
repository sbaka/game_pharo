Class {
	#name : #MygGalaBlueMonster,
	#superclass : #MygGalaMonster,
	#instVars : [
		'isBlueMonster'
	],
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaBlueMonster class >> textualMapCharacter [

	^ $b
]

{ #category : #accessing }
MygGalaBlueMonster >> backgroundRepresentation [

	^ MygGalaBoxElement blueMonsterIcon 
]

{ #category : #'as yet unclassified' }
MygGalaBlueMonster >> isBlueMonster [

	^ true
]
