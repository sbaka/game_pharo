Class {
	#name : #MygGalaRedMonster,
	#superclass : #MygGalaMonster,
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaRedMonster class >> textualMapCharacter [

	^ $m
]

{ #category : #accessing }
MygGalaRedMonster >> backgroundRepresentation [

	^ MygGalaBoxElement redMonsterIcon 
]
