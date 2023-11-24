Class {
	#name : #MygGalaElement,
	#superclass : #MygAbstractBox,
	#category : #'game_pharo'
}

{ #category : #initialization }
MygGalaElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
MygGalaElement class >> textualMapCharacter [

	^ $Z
]

{ #category : #initialization }
MygGalaElement >> configured [ 

	^self
]
