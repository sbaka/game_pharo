Class {
	#name : #MygGalaBlueMonster,
	#superclass : #MygGalaMonster,
	#category : #MygGalaga
}

{ #category : #'default encoding' }
MygGalaBlueMonster class >> textualMapCharacter [

	^ $b
]

{ #category : #accessing }
MygGalaBlueMonster >> backgroundRepresentation [

	^ MygGalaBoxElement blueMonsterIcon 
]
