Class {
	#name : #TestGalaga,
	#superclass : #TestCase,
	#category : #'MygGalaga-Tests'
}

{ #category : #tests }
TestGalaga >> testPlayerBackgroundIsSetCorrectly [

	| board|
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		
	self assert: board player position x equals: 6.
	self assert: board player position y equals: 10.
	
	self assert: board player background position x equals: 6.
	self assert: board player background position y equals: 10.
]

{ #category : #tests }
TestGalaga >> testPlayerIsSetCorrectly [

	| board position |
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		
	self assert: board player position x equals: 6.
	self assert: board player position y equals: 10.
]

{ #category : #tests }
TestGalaga >> testPositionOfBulletIsInFrontOfPlayerOnInitialization [

	| board positionPlayer positionBullet |
	board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			           fromPackage: MygGalaBoard package) do: [ :each |
			          each configured ]).
	positionPlayer := board player position.
	positionBullet := board bullet position.
	Transcript show: positionBullet.
	self assert: positionPlayer x equals: positionBullet x.
	self assert: positionPlayer y equals: positionBullet y + 1
]

{ #category : #tests }
TestGalaga >> testPositionOfMonstrerInTheBoard [

	| board position |
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		
		self assert: ((board atColumn: 8  atRow:  7) isKindOf: MygGalaRedMonster ).
		self assert: ((board atColumn: 3  atRow:  5) isKindOf: MygGalaRedMonster ).
		self assert: ((board atColumn: 5  atRow:  3) isKindOf: MygGalaRedMonster ).
		
		self assert: ((board atColumn: 3  atRow:  7) isKindOf: MygGalaBlueMonster ).
		self assert: ((board atColumn: 8 atRow:  5) isKindOf: MygGalaBlueMonster ).
		
		
	
	
			


	


		
	
	
]

{ #category : #tests }
TestGalaga >> testPositionOfPlayerDontPassTheLimitOfBoard [

	| board  |
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		
		Transcript show: board player position
	
			


	


		
	
	
]

{ #category : #tests }
TestGalaga >> testPositionOfPlayerWhenHeMoveInADirection [

	| board position |
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		 
	position := board player position.
	Transcript show: board player position x.
	self assert: (board player move: CpDirection east).
   Transcript show: board player position x.
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
		
		self assert: board player position x equals: 7.
		Transcript show: board.

		
	
	
]

{ #category : #tests }
TestGalaga >> testPositionOfPlayerWhenHePassLimit [

	| board position |
		board := MygGalaBoard createWithBoard: ((MygLevelImporter
			           fromString: '##########
#        #
#   m    #
#        #
# m    b #
#        #
# b    m #
#        #
#    h   #
#    @   #'
			     fromPackage: MygGalaBoard package) do: [ :each |
			     each configured ]).
		 
	position := board player position x.
	
	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: position + 1.	


	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: position + 2.	
			
	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: position + 3.	
			
   board player move: CpDirection east.
	self
		assert: board player position x
		equals: position + 3.	

	


		
	
	
]
