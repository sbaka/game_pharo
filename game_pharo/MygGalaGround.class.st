Class {
	#name : #MygGalaGround,
	#superclass : #MygGalaElement,
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaGround class >> textualMapCharacter [
	^ Character space.
]

{ #category : #accessing }
MygGalaGround >> backgroundRepresentation [

	^ MygGalaBoxElement spaceIcon  
]
