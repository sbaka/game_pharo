Class {
	#name : #MygGalaMonster,
	#superclass : #MygGalagaMovable,
	#instVars : [
		'isMonster'
	],
	#category : #'game_pharo'
}

{ #category : #actions }
MygGalaMonster >> bringIn: anActor going: aDirection [
	"aMonster does not move in a monster."

	anActor isMonster
		ifTrue: [ ^ false ]
		ifFalse: [ ^ super bringIn: anActor going: aDirection ]
]

{ #category : #initialization }
MygGalaMonster >> initialize [

	isMonster := true.
	super initialize
]

{ #category : #actions }
MygGalaMonster >> isMonster [

	^ isMonster
]

{ #category : #actions }
MygGalaMonster >> isMonster: aBoolean [
	
	isMonster := aBoolean  
]
