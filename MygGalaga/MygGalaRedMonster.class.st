Class {
	#name : #MygGalaRedMonster,
	#superclass : #MygGalaMonster,
	#category : #MygGalaga
}

{ #category : #'default encoding' }
MygGalaRedMonster class >> textualMapCharacter [

	^ $m
]

{ #category : #accessing }
MygGalaRedMonster >> backgroundRepresentation [

	^ MygGalaBoxElement redMonsterIcon 
]
