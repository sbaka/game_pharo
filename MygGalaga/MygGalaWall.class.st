Class {
	#name : #MygGalaWall,
	#superclass : #MygGalaElement,
	#category : #MygGalaga
}

{ #category : #'default encoding' }
MygGalaWall class >> textualMapCharacter [

	^ $#
]

{ #category : #accessing }
MygGalaWall >> backgroundRepresentation [

	^ MygGalaBoxElement spaceIcon
]

{ #category : #accessing }
MygGalaWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."

	^ false
]
