Class {
	#name : #MygGalaBlueMonster,
	#superclass : #MygGalaMonster,
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

{ #category : #testing }
MygGalaBlueMonster >> isBlueMonster [

	^ true
]
