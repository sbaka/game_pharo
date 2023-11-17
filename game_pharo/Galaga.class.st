Class {
	#name : #Galaga,
	#superclass : #Object,
	#category : #'game_pharo'
}

{ #category : #'instance creation' }
Galaga class >> open [

	|space button|
	button := ToButton new labelText: 'start'.
	button whenClickedDo:  [ GalgaManager new launch ].
	space := BlSpace new.
	space root addChild: button.
	space extent: 200@200.
	space show
]
