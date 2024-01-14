Class {
	#name : #MygGalaGround,
	#superclass : #MygGalaElement,
	#category : #MygGalaga
}

{ #category : #'default encoding' }
MygGalaGround class >> textualMapCharacter [

	^ Character space
]

{ #category : #accessing }
MygGalaGround >> backgroundRepresentation [

	^ MygGalaBoxElement spaceIcon
]
