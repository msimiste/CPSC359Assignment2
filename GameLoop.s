.section .text
.globl ParseSNES
.globl updateBullet
.globl updateState
.globl drawText
.globl startScreen
.globl scoreScreen
.globl pauseScreen
.globl resultScreen
.globl initScreen
.globl beginLoop
.globl pauseLoop



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
		//bl drawBounds
		ldr r0, =pauseBoundsInfo		
		bl drawPauseBounds
		

SNESGET:

	
				
		bl SNES_Input
		
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
		
		
		
		
		pop {lr}
		bx lr



ParseSNES:

needBreak:

	push {lr}

	mov	r0, r12


	

	ldr 	r11, =0xf7ff
	cmp 	r12, r11
	bleq	moveUp
	
	/*
	mov	r11, #1
	lsl	r11, #11
	ands	r11, r12
	bleq	moveUp*/
	
	
	
	ldr 	r11, =0xfbff
	cmp 	r12, r11
	bleq	moveDown
	
	
	
	//conlan code
	/*mov	r11, #1
	lsl	r11, #10
	ands	r11, r12
	bleq	moveDown */
	
	
	ldr 	r11, =0xfdff
	cmp 	r12, r11
	bleq	moveLeft
	
	//conlan code
	/*mov	r11, #1
	lsl	r11, #9
	ands	r11, r0 
	bleq	moveLeft*/
	
	
	ldr 	r11, =0xfeff
	cmp 	r12, r11
	bleq	moveRight
	
	//conlan code
	
	/*
	mov	r11, #1
	lsl	r11, #8
	ands	r11, r12
	bleq	moveRight*/
	
	
	mov	r11, #1
	lsl	r11, #7
	ands	r11, r12
	bleq	startShoot	
	
	ldr		r11, =0xEFFF
	cmp		r11, r12
	bleq	pauseLoop
		
			
	pop	{lr}
	bx lr
	
startFun:

	bx lr
	
updateBullet:
	
		push {lr}

		ldr r4, =PlayerBullet
		ldr r0, [r4, #20]
		cmp	r0, #0
		beq	endUpdateBullet
		bl moveRight
		
endUpdateBullet:
		pop {lr}
		bx	lr
		

		
updateState:
			push {lr}
	
			ldr r4, =PlayerBullet
			bl removeObject
			pop {lr}
			bx lr

		
removeObject:
			push {r4, lr}
				
			ldr r5, [r4]     						// x value
			ldr r6, [r4, #4] 						// y value
			ldr r7, =0x000000 						// color changed to black
			ldr r8, [r4, #8] 						// size
			ldr r9, [r4, #20]						// check to see if object exists
			cmp	r9, #0								// if r9 == 1, object exists, if r9 =0 object does not exist
			
		
			beq drawBlack							// Object does not exist, draw black
			
			ldr	r10, =boundsInfo					
			ldr	r10, [r10, #12]						//load east bound
			add	r11, r5, #16						//set correct bound				
			cmp	r11, r10							//check correct bound
			blt	endRemove 
					

drawBlack:
		
		bl	drawSquare
		mov	r9, #0	
		str	r9, [r4, #20]
		
endRemove:
				
			pop {r4,lr}
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

	bl drawBounds
	bl scoreScreen	
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
	ldr	r10, =0xfFcc
	bl drawText
	
	ldr	r0, =NewInfo
	ldr	r1, =endNewInfo
	ldr	r2,	=461
	ldr	r3, =340
	ldr	r10, =0xfFcc
	bl drawText
	
	ldr	r0, =QuitInfo
	ldr	r1, =endQuitInfo
	ldr	r2,	=461
	ldr	r3, =360
	ldr	r10, =0xfFcc
	bl drawText
	
	pop {lr}
	bx lr
	
resultScreen:

	push {lr}

	ldr	r0, =GameWon
	ldr	r1, =endGameWon
	ldr	r2,	=450
	ldr	r3, =360
	ldr	r10, =0x00FF
	bl drawText
	
	
	ldr	r0, =GameLost
	ldr	r1, =endGameLost
	ldr	r2,	=450
	ldr	r3, =360
	ldr	r10, =0xf000
	bl drawText
	
	pop {lr}
	bx	lr

					

