.section .text
.globl ParseSNES
.globl updateBullet
.globl updateState
.globl drawText
.globl startScreen
.globl scoreScreen
.globl pauseScreen
.globl resultLose
.globl initScreen
.globl beginLoop
.globl pauseLoop
.globl resultWon
.globl InitialStateLoop
.globl playerBulletHits
.globl computerBulletHits
.globl computerPlayerCollision
.globl killNoHardness
.globl barrierHit
.globl drawScore
.globl parseScore
.globl calcScore
.globl drawScoreBlack
.globl checkEndCondition


beginLoop:
		push {lr}
		

begin:	

		bl SNES_Input
	
		ldr		r11, =0xEFFF
		cmp		r11, r12
		blne	begin
		
		
		ldr	r0, =gameNameInfo
		ldr	r1, =endGameNameInfo
		ldr	r2,	=437
		ldr	r3, =347
		ldr	r10, =0x0000
		bl drawText

		ldr	r0, =TitleInfo
		ldr	r1, =endTitleInfo
		ldr	r2,	=281
		ldr	r3, =367
		ldr	r10, =0x0000
		bl drawText
		
		ldr	r0, =StartInfo
		ldr	r1, =endStartInfo
		ldr	r2,	=425
		ldr	r3, =387
		ldr	r10, =0x0000
		bl drawText
		
		pop {lr}
		bx lr
		
pauseLoop:

		push {lr}	
		
		
		ldr r0, =pauseBoundsInfo
		bl drawPBack
		bl pauseScreen
		ldr r0, =pauseBoundsInfo		
		bl drawPauseBounds
		mov r4, #0x1 					//state counter

SNESGET:
			
		bl SNES_Input
		
		ldr 	r11, =0xf7ff //mov up
		cmp 	r12, r11
		subeq	r4, #1
		
		
		ldr 	r11, =0xfbff	//mov 
		cmp 	r12, r11
		addeq	r4, #1
	
		cmp	r4, #0
		moveq	r4, #3
		cmp	r4, #4
		moveq	r4, #1
		mov	r0, r4

		bl updatePauseColors
		
		ldr		r11, =0xFF7F
		cmp		r11, r12
		blne	SNESGET


		ldr r0, =pauseBoundsInfo
		
		bl drawPBlack
		ldr r0, =pauseBoundsInfo
		mov r1, #0
		str r1, [r0, #16]
		bl drawPauseBounds
		ldr r0, =pauseBoundsInfo
		ldr r1, =0x66FF66
		str  r1, [r0, #16]
	
		cmp r4, #2
		bne	notNewGame

		ldr r0, =beginObjects
		ldr r1, =endObjects
		bl clearStateLoop
		b	_start
		
notNewGame:	
		
		cmp r4, #3
		bleq resultLose
		beq 	haltLoop$
		
		ldr r9, =0x000fffff
		bl delay
		
		
		
		pop {lr}
		bx lr
		
updatePauseColors:

		push {r4, r11, r12, lr}

		mov	r4, r0
		cmp	r4, #3
		beq state3
		cmp r4, #2
		beq	state2
state1:
		ldr r1, =continueColor
		ldr r2, =0x0000f8 
		str r2, [r1]
		
		ldr r1, =newColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		ldr r1, =quitColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		bl pauseScreen
		b endUpdatePauseColors
state2:
		ldr r1, =continueColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		ldr r1, =newColor
		ldr r2, =0x0000f8 
		str r2, [r1]
		
		ldr r1, =quitColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		bl pauseScreen
		b endUpdatePauseColors

state3:
		ldr r1, =continueColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		ldr r1, =newColor
		ldr r2, =0xfFcc
		str r2, [r1]
		
		ldr r1, =quitColor
		ldr r2, =0x0000f8 
		str r2, [r1]
		
		bl pauseScreen
		b endUpdatePauseColors

endUpdatePauseColors:

		ldr r9, =0x000fffff
		bl delay
		
		pop {r4, r11, r12, lr}
		bx lr

ParseSNES:

needBreak:

	push {lr}

	mov	r0, r12

	ldr 	r11, =0xf7ff
	cmp 	r12, r11
	bleq	moveUp
	
	ldr 	r11, =0xfbff
	cmp 	r12, r11
	bleq	moveDown

	ldr 	r11, =0xfdff
	cmp 	r12, r11
	bleq	moveLeft

	ldr 	r11, =0xfeff
	cmp 	r12, r11
	bleq	moveRight

	mov	r11, #1
	lsl	r11, #7
	ands	r11, r12
	bleq	startShoot	
	
	ldr		r11, =0xEFFF
	cmp		r11, r12
	bleq	pauseLoop
		
			
	pop	{lr}
	bx lr
	
updateBullet:
	
		push {lr}

		ldr r4, =PlayerBullet
		ldr r0, [r4, #20]
		cmp	r0, #0
		beq	loadBullets
		bl moveRight
		
loadBullets:
		ldr	r4, =beginComputerBulletObjects
		ldr	r9, =endObjects
		ldr r0, [r4]
updateCompBullet:

		cmp	r4, r9
		beq	endUpdateBullet		
		ldr r0, [r4, #20]
		cmp	r0, #1		
		bleq moveLeft
		add	r4, #40         												//
		b	updateCompBullet
		
endUpdateBullet:
		pop {lr}
		bx	lr
		

		
updateState:

			push {lr}
			
			ldr r0, =beginBarriers
			ldr	r1, =endObjects
			ldr	r2, =boundsInfo
			bl checkBounds
			ldr r0, =beginObjects
			ldr	r1, =endObjects
			bl removeObjects
	
			pop {lr}
			bx lr
			
			
checkBounds:

		push {lr}
		
		mov r4, r0		//object address
		mov	r5, r1		//end of objects
		mov	r6, r2		//boundsinfo
		ldr	r7,	[r6, #8] //west bound
		ldr	r8, [r6, #12] //east bound
		
topOfBounds:		
		ldr	r9, [r4] //object x coord
		add r9, #16
		cmp	r9, r8 //cmp on east bound
		bgt	outOfBounds
		ldr	r9, [r4] //object x coord
		sub r9, #16
		cmp	r9, r7 //cmp on west bound
		bgt	endCheckBounds
		
outOfBounds:
		mov	r3,	#0
		str	r3, [r4, #20]
		
		//bl drawSquare
		
endCheckBounds:
		add	r4, #40													         //
		cmp	r4, r5
		bne	topOfBounds		
		pop {lr}
		bx lr


removeObjects:

		push {lr}
		
		mov	r4, r0		//object address
		mov	r11, r1		//end object address
		
topOfRemove:
		ldr r9, [r4, #20]						// check to see if object exists
		cmp	r9, #0								// if r9 == 1, object exists, if r9 =0 object does not exist
		bne continueRemove
		
		ldr r5, [r4]     						// object x value
		ldr r6, [r4, #4] 						// object y value
		ldr r7, =0x000000 						// color changed to black
		ldr r8, [r4, #8] 						// object size
		bl drawSquare
		mov r0, #500
		mov r1, #20
		str r0, [r4]
		str r1, [r4, #4]
		
continueRemove:
		add	r4, #40													         //
		cmp	r4, r11
		bne	topOfRemove		
	
		pop {lr}
		bx lr
		
			
clearStateLoop:
			push {r4, lr}
		
			mov r4, r0 						// start of objects address			
			mov r5, r1						// end of objects address
stateLoop:
				
			cmp r4, r5
			beq endClearStateLoop
			
			mov	r6, #0
			str r6, [r4, #20]

			add r4, #40											         //
			b stateLoop
			
			
endClearStateLoop:
			ldr r0, =beginObjects
			ldr	r1, =endObjects
			bl removeObjects
			ldr	r0, =beginObjects
			ldr r1, =endCharacterObjects
			bl 	InitialStateLoop

			pop {r4, lr}
			bx lr		


InitialStateLoop:
			push {r4, lr}
			mov r4, r0 						// start of Character objects address			
			mov r9, r1						// end of Character objects address
InitStateLoop:								//r0 = x val, r1 = y val, r7 = color val, r8 = size val

				
			cmp r4, r9
			beq endInitialStateLoop
			
			mov	r2, #1						//reset init values
			str	r2, [r4, #20]
			ldr r2, [r4, #24]				
			str r2, [r4]
			ldr r2, [r4, #28]
			str r2, [r4, #4]
			ldr	r2, [r4, #36]
			str	r2, [r4, #32]
			
			ldr	r2, =InitScoreInt
			ldr	r3, [r2]
			ldr	r2, =ScoreInt
			str	r3, [r2]

			
			ldr r5, [r4]					//redraw objects
			ldr	r6, [r4, #4]
			ldr r7, [r4, #16]
			ldr r8, [r4, #8]
			
			bl drawSquare
						
			add r4, #40												         //
			b InitStateLoop
			
			
endInitialStateLoop:
			ldr	r5, =computerDirectionInfo //reassert comp direction info
			ldr	r6, [r5, #16]
			str	r6,	[r5]
			str	r6,	[r5, #12]
			
			pop {r4, lr}
			bx lr
		
playerBulletHits:

		push {lr}
		
		mov	r4, r0 		//address of playerbullet
		mov	r5, r1		//address of beginning computer players
		mov	r6, r2		//address of end computer players
		
		ldr	r3, [r4, #20] //bullet exists value
		cmp	r3, #0
		beq	endPlayerBulletHits

topPlayerBulletHitsLoop:

		ldr	r3, [r5, #20]
		cmp	r3, #0
		beq	endPlayerBulletHitsLoop
		
		ldr	r7, [r4]  //player bullet x value
		add	r7,	#6	  //correct bullet x offset
		ldr	r8, [r5]  //computer player x value
		cmp	r7, r8
		bne	endPlayerBulletHitsLoop
		
		ldr	r7, [r4, #4]  //player bullet y value
		add	r7,	#6	  //correct bullet y offset
		ldr	r8, [r5, #4]  //computer player y value
		cmp	r7, r8
		beq	goodPlayerBulletHit
		
		/*ldr	r7, [r4]  //player bullet x value
		add	r7,	#22	  //correct bullet x offset
		ldr	r8, [r5]  //computer player x value
		cmp	r7, r8
		bne	endPlayerBulletHitsLoop*/
		
		ldr	r7, [r4, #4]  //player bullet y value
		add	r7,	#22	  //correct bullet y offset
		ldr	r8, [r5, #4]  //computer player y value
		cmp	r7, r8
		beq	goodPlayerBulletHit
		
		ldr	r7, [r4, #4]  //player bullet y value
		sub	r7,	#10	  //correct bullet y offset
		ldr	r8, [r5, #4]  //computer player y value
		cmp	r7, r8
		bne	endPlayerBulletHitsLoop
		
goodPlayerBulletHit:
	
		ldr	r3, [r5, #32]	//computer hardness value
		sub	r3, #1					
		str	r3, [r5, #32]	//store back 
		
		mov	r3, #0
		str	r3, [r4, #20]	//set player bullet exists value
		b	endPlayerBulletHits

endPlayerBulletHitsLoop:
		add r5, #40													//set address of next computer player
		cmp	r5,	r6		//compare to end address
		beq	endPlayerBulletHits
		b topPlayerBulletHitsLoop
		
		
endPlayerBulletHits:

		pop {lr}
		bx	lr

computerBulletHits:

		push {lr}
		
		mov	r4, r0 		//address of beginning computer bullet
		mov	r5, r1		//address of end computer bullets
		ldr	r6, [r2]		//player's east x value
		ldr	r7, [r2, #4]	//player's south y value
	

computerBulletHitsLoop:
	
		cmp	r4, r5
		beq	endComputerBulletHits
		
		ldr	r3, [r4, #20] //bullet exists value
		cmp	r3, #0
		beq	endComputerBulletHitsLoop

		ldr	r8, [r4]		//computer bullet x val
		add	r8, #6
		cmp	r6, r8		//compare x vals
		beq	goodComputerBulletHitX

		ldr	r8, [r4]		//computer bullet x val
		sub	r8, #10
		cmp	r6, r8		//compare x vals
		beq	goodComputerBulletHitX

		ldr	r8, [r4]		//computer bullet x val
		sub	r8, #26
		cmp	r6, r8		//compare x vals
		beq	goodComputerBulletHitX

		//ldr	r8, [r4]		//computer bullet x val
		//add	r8, #38
		//cmp	r6, r8		//compare x vals
		//beq	goodComputerBulletHitX

		b	endComputerBulletHitsLoop

goodComputerBulletHitX:

		ldr	r9, [r4, #4]	//computer bullet y val
		add	r9, #6
		cmp	r7, r9		//compare y vals
		bne	endComputerBulletHitsLoop

goodComputerBulletHit:
		bl	reducePlayerScore

		mov	r3, #0
		str	r3, [r4, #20]	//set player bullet exists value

endComputerBulletHitsLoop:

		add	r4, #40
		b	computerBulletHitsLoop

endComputerBulletHits:

		pop {lr}
		bx lr
		
reducePlayerScore:

		push {r4-r12, lr}
		
		ldr	r4, =ScoreInt
		ldr	r5, [r4]
		sub	r5, #10
		str	r5, [r4]
		
		pop {r4-r12, lr}
		bx	lr


barrierHit:

		push {lr}
		
		mov	r4, r0	//barrier begin address
		mov	r5, r1	//barrier end address
		//mov	r6, r2	//begin address of computer players and all bullets
		
barrierHitLoop:	
		cmp r4, r5
		beq barrierHitEnd
		
		ldr	r2,	=beginBulletObjects
		ldr	r3,	=endObjects
		//ldr r0, [r6, #8]
		//cmp r0, #4
		bl	bulletBarrierCheck
		ldr r2, =beginComputerObjects
		bl		CPUBarrierCheck
		add r4, #40
		b barrierHitLoop
		

barrierHitEnd:
		
		pop {lr}		
		bx lr
		
bulletBarrierCheck:
		
		push {r4-r7,lr}
		
	
		mov	r6, r2	//begin address of computer players and all bullets
		mov	r7,	r3	//end address of above
		
		
bulletBarrierLoop:		
		cmp r6, r7
		beq endBulletBarrierCheck
	
		ldr r8, [r4] 		//barriers x value
		ldr r9, [r4, #4] 	//barriers y value
		ldr r10, [r6]		//bulletts x value
		add r10, #6			// offset
		ldr r11, [r6, #4]	// bullets y value
		add r11, #6			// offset
		
		cmp r8, r10
		bne endBulletBarrierLoop	
		
		
endBulletBarrierCheckX:		
		cmp r9, r11
		bne endBulletBarrierLoop
		
		mov r12, #0
		str r12, [r4, #32]
		str r12, [r6, #20]
		// b endBulletBarrierCheck as there can only be 1 hit per bullet/round
endBulletBarrierLoop:

		add r6, #40
		b bulletBarrierLoop	
		
endBulletBarrierCheck:
		
		pop {r4-r7, lr}
		bx lr
		
		
		
CPUBarrierCheck:


		push {r4-r7,lr}
		
	
		mov	r6, r2	//begin address of computer players and all bullets
		mov	r7,	r3	//end address of above
		
CPUBarrierLoop:

		cmp r6, r7
		beq endCPUBarrierCheck
	
		ldr r8, [r4] 		//barriers x value
		ldr r9, [r4, #4] 	//barriers y value
		ldr r10, [r6]		//CPU x value				
		ldr r11, [r6, #4]	// CPU y value		
		
		cmp r8, r10
		bne endCPUBarrierLoop

endCPUBarrierCheckX:		
		cmp r9, r11
		bne endCPUBarrierLoop
		
		mov r12, #0
		str r12, [r4, #20]
		str r12, [r6, #20]																				//baspingle
		// b endBulletBarrierCheck as there can only be 1 hit per bullet/round
		
endCPUBarrierLoop:

		add r6, #40
		b CPUBarrierLoop	

endCPUBarrierCheck:

		
		pop {r4-r7, lr}
		bx lr
		
		
		
		
		
		
		
computerPlayerCollision:

		push {lr}
		
		mov	r4, r0 		//address of beginning computer characters
		mov	r5, r1		//address of end computer characters
		mov	r11, r2
		ldr	r6, [r2]		//player's east x value
		ldr	r7, [r2, #4]	//player's south y value
	
computerPlayerCollisionLoop:
	
		cmp	r4, r5
		beq	endComputerPlayerCollision
		
		ldr	r3, [r4, #20] //computer player exists value
		cmp	r3, #0
		beq	endComputerPlayerCollisionLoop

		ldr	r8, [r4]		//computer bullet x val
		cmp	r6, r8		//compare x vals
		beq	goodPlayerComputerCollisionX

		/*ldr	r8, [r4]		//computer bullet x val
		sub	r8, #10
		cmp	r6, r8		//compare x vals
		beq	goodPlayerComputerCollisionX

		ldr	r8, [r4]		//computer bullet x val
		sub	r8, #26
		cmp	r6, r8		//compare x vals
		beq	goodPlayerComputerCollisionX*/

		b	endComputerPlayerCollisionLoop

goodPlayerComputerCollisionX:

		ldr	r9, [r4, #4]	//computer bullet y val
		cmp	r7, r9		//compare y vals
		bne	endComputerPlayerCollisionLoop

goodPlayerComputerCollision:

		bl	reducePlayerScore

		mov	r3, #0
		str	r3, [r4, #20]															//set computer player hardness value baspingle

endComputerPlayerCollisionLoop:

		add	r4, #40
		b	computerPlayerCollisionLoop

endComputerPlayerCollision:

		pop {lr}
		bx lr
		
		
		
		
		
		
		
		
		
		
		
		
killNoHardness:

		push {lr}
		
		mov	r4, r0	//beginning computer objects adress
		mov	r5, r1  //end object adress

killLoopTop:
		ldr	r6,	[r4, #32] //load hardness
		cmp	r6, #0
		bne	noKill
		mov	r1, #0
		str	r1, [r4, #20] //set exists value to 0
//test:
		//ldr	r1, [r4, #20]
		//ldr	r2, [r4, #32]
		
noKill:
		add	r4, #40												//
		cmp	r4, r5
		bne	killLoopTop
		
		pop {lr}
		bx lr
		
	
drawText:
	push {lr}
	
		mov r4, r0				//address passed in on r0
		mov	r5, r1				//end address passed in on r1
		mov	r6, r2				//x coord input
		mov	r7, r3				//y coord input
		mov	r1, r10
 
topText:
		ldr r0, [r4]			//pass out int value for char
		add	r4, #4	
		bl	DrawChar
		cmp	r4, r5
		beq	endDrawText
		add	r6, #12
		mov	r2, r6				//pass out x coord
		mov	r3, r7				//pass out y coord
		mov	r1, r10
		b	topText
		
endDrawText:

	pop {lr}
	bx	lr
	
initScreen:

	push {lr}
	
west2:
	ldr r5, =boundsInfo
	ldr r5, [r5, #16]

	bl drawBounds
	bl scoreScreen
	bl drawScore	
	bl startScreen
	
	pop {lr}
	bx lr
	
scoreScreen:

	push {lr}

	ldr	r0, =scoreInfo
	ldr	r1, =endScoreInfo
	mov	r2,	#4
	mov	r3, #16
	ldr	r10, =0xF800
	bl drawText
	
	pop {lr}
	bx lr
	
drawScore:

	push {lr}

	ldr r0, =ScoreHex // score hex address value
	ldr r1, =endScoreHex // end score hex address 
	mov	r2,	#88
	mov	r3, #16
	ldr	r10, =0xcccc00 
	bl drawText
	
	pop {lr}
	bx lr
	
drawScoreBlack:

	push {lr}

	ldr r0, =ScoreHex // score hex address value
	ldr r1, =endScoreHex // end score hex address 
	mov	r2,	#88
	mov	r3, #16
	ldr	r10, =0x0000
	bl drawText
	
	pop {lr}
	bx lr
	
	
parseScore:

	push {lr}
	
	
	ldr	r4, =ScoreInt
	ldr	r4, [r4]		//int score value
	mov	r5, #0			//hundreds counter
	mov	r6, r4
	ldr	r7, =ScoreHex
	
hundredsLoop:
	cmp	r6, #100
	blt	twoDigitNumber
	sub	r6, #100
	add	r5, #1
	b	hundredsLoop
	
	
	
twoDigitNumber:		

	add	r5,	#48
	str	r5, [r7, #4]
	
	mov	r5, #0
	
tensLoop:	
	cmp	r6, #10
	blt	oneDigitNumber
	sub	r6, #10
	add	r5, #1
	b	tensLoop
	
oneDigitNumber:

	add	r5,	#48
	str	r5, [r7, #8]
	
	cmp	r6, #0
	ble	storeZero
	
storeFive:

	mov	r5, #53
	str	r5,	[r7, #12]
	b	parseScoreEnd
	

storeZero:

	mov	r5, #48
	str	r5,	[r7, #12]

parseScoreEnd:

	pop {lr}

	bx lr
	
calcScore:

	push {lr}

	mov	r6, #0						//total

	ldr	r4, =beginComputerObjects
	ldr	r0, =startKnights
	
pawnCalc:	
	ldr	r5, [r4, #32]
	cmp	r5, #0
	addeq	r6, #5
	moveq	r5,	#1
	str	r5, [r4, #32]
	add	r4, #40
	cmp	r4, r0	
	bne	pawnCalc
	
	
	ldr	r0, =startQueens
	
knightCalc:
	ldr	r5, [r4, #32]
	cmp	r5, #0
	addeq	r6, #10
	moveq	r5,	#1
	str	r5, [r4, #32]
	add	r4, #40
	cmp	r4, r0	
	bne	knightCalc
	
	ldr	r0, =endCharacterObjects

queenCalc:

	ldr	r5, [r4, #32]
	cmp	r5, #0
	addeq	r6, #100
	moveq	r5,	#1
	str	r5, [r4, #32]
	add	r4, #40
	cmp	r4, r0	
	bne	queenCalc
	

	ldr	r0, =ScoreInt
	ldr	r1, [r0]
	add	r6, r1
	str	r6, [r0]
	
	pop {lr}
	bx	lr

checkEndCondition:

	push {lr}
	
	ldr	r4, =ScoreInt
	ldr	r5, [r4]
	cmp	r5, #0
	ble	gameLost
	
	ldr	r4, =beginComputerObjects
	ldr	r5, =endCharacterObjects

checkWin:
	
	cmp	r4, r5
	beq gameWon
	ldr	r6, [r4, #20]
	cmp	r6, #0
	bne	continueGame
	add r4, #40
	b checkWin	
	
	
gameWon:

	bl resultWon
	bl	endStateLoop
	//bl haltLoop$
	
	
gameLost:

	bl resultLose
	bl 	endStateLoop
	//bl haltLoop$
	
	
continueGame:
	pop {lr}
	bx	lr
	
	
endStateLoop:

	push {lr}
	
noInputLoop:

	bl SNES_Input
testNoInput:
	ldr	r0, =0xffff
	cmp	r12, r0
	beq	noInputLoop
	
	ldr r0, =beginObjects
	ldr r1, =endObjects
	bl clearStateLoop
	
	ldr	r0, =GameLost
	ldr	r1, =endGameLost
	ldr	r2,	=450
	ldr	r3, =360
	ldr	r10, =0x0000
	bl drawText	
	
	b	_start

	
	
	pop {lr}
	bx lr


	
startScreen:

	push {lr}
	
	
	ldr	r0, =gameNameInfo
	ldr	r1, =endGameNameInfo
	ldr	r2,	=437
	ldr	r3, =347
	ldr	r10, =0xaaaa
	bl drawText

	ldr	r0, =TitleInfo
	ldr	r1, =endTitleInfo
	ldr	r2,	=281
	ldr	r3, =367
	ldr	r10, =0x09F8
	bl drawText
	
	ldr	r0, =StartInfo
	ldr	r1, =endStartInfo
	ldr	r2,	=425
	ldr	r3, =387
	ldr	r10, =0x66ff
	bl drawText
	
	pop {lr}
	bx lr
	
pauseScreen:

	push {lr}
	
	ldr	r0, =PauseInfo
	ldr	r1, =endPauseInfo
	ldr	r2,	=425
	ldr	r3, =300
	ldr	r10, =0xf800
	bl drawText
	
	ldr	r0, =ContinueInfo
	ldr	r1, =endContinueInfo
	ldr	r2,	=461
	ldr	r3, =320
	ldr	r10, =continueColor
	ldr r10, [r10]
	bl drawText
	
	ldr	r0, =NewInfo
	ldr	r1, =endNewInfo
	ldr	r2,	=461
	ldr	r3, =340
	ldr	r10, =newColor
	ldr r10, [r10]
	bl drawText
	
	ldr	r0, =QuitInfo
	ldr	r1, =endQuitInfo
	ldr	r2,	=461
	ldr	r3, =360
	ldr	r10, =quitColor
	ldr r10, [r10]
	bl drawText
	
	pop {lr}
	bx lr
	
resultLose:


	push {lr}
		
	ldr	r0, =GameLost
	ldr	r1, =endGameLost
	ldr	r2,	=450
	ldr	r3, =360
	ldr	r10, =0xf000
	bl drawText	
	
	pop {lr}
	bx	lr
	
resultWon:
	
	push {lr}

	ldr	r0, =GameWon
	ldr	r1, =endGameWon
	ldr	r2,	=450
	ldr	r3, =360
	ldr	r10, =0x00FF
	bl drawText
	
	pop {lr}
	bx	lr
	

					

