Class {
	#name : #MygGalaBlueMonster,
	#superclass : #MygGalaElement,
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
