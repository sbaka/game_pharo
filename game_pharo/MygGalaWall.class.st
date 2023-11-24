Class {
	#name : #MygGalaWall,
	#superclass : #MygGalaElement,
	#category : #'game_pharo'
}

{ #category : #'default encoding' }
MygGalaWall class >> textualMapCharacter [

	^ $#
]

{ #category : #accessing }
MygGalaWall >> backgroundRepresentation [

	^ MygGalaBoxElement wallIcon
]
