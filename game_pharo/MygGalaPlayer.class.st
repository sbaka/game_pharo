Class {
	#name : #MygGalaPlayer,
	#superclass : #MygGalaElement,
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
MygGalaPlayer >> backgroundRepresentation [

	^ MygGalaBoxElement spaceShipIcon  
]
