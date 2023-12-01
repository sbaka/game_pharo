Class {
	#name : #MygGalaBullet,
	#superclass : #MygGalaElement,
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaBullet class >> textualMapCharacter [

	^ $h
]

{ #category : #accessing }
MygGalaBullet >> backgroundRepresentation [

	^ MygGalaBoxElement bulletIcon 
]
