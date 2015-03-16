.section	.text
.globl		moveLeft
<<<<<<< HEAD

=======
.globl 		moveRight
.globl 		moveDown
.globl 		moveUp
<<<<<<< HEAD
>>>>>>> 460269df41933aa54da1939563cfd194a2d7af2e
=======
.globl		startShoot
>>>>>>> 3bd42aacf1ec58a1e03b80098412e7a235ea7b79




moveLeft:
		
		push {r4-r12, lr}
		
<<<<<<< HEAD
		ldr r5, [r4]     	// x value
		ldr r6, [r4, #4] 	// y value
		ldr r7, [r4, #16]	// color
		ldr r8, [r4, #8] 	// size
		ldr r9, [r4, #12] 	//speed
		
		//bl delay
		bl drawSquare
		
see:		
		ldr r5, [r4]     	// x value
		ldr r6, [r4, #4] 	// y value
		ldr r7, =0x000000 	// color
		ldr r8, [r4, #8] 	// size
		ldr r9, [r4, #12] 	//speed
		
		bl drawSquare
		//bl delay
test1:		
		sub r5, r5, r8
		str r5, [r4]
		ldr r7, [r4, #16]
		bl drawSquare
=======
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		ldr	r10, =boundsInfo					
		ldr	r10, [r10, #8]						//load west bound
		sub	r11, r5, r8//, lsl #1				//set correct bound
		
		cmp	r11, r10							//check correct bound
		ble	endLeft								//branch if bound is present
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in color of character
				
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, =0x000000 						// color changed to black
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in black
		
		sub r5, r5, r8							// subtract 1 "length" or 1 grid size from the character in the neg-x direction (ie left)	
		str r5, [r4]							// store the new xvalue in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
>>>>>>> 460269df41933aa54da1939563cfd194a2d7af2e
		
endLeft:		
		pop {r4-r12, lr}
		bx lr
<<<<<<< HEAD
=======
		
		
moveRight:										// moves player to the right
		
		push {r4-r12, lr}						// push values to the stack
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		ldr	r10, =boundsInfo					
		ldr	r10, [r10, #12]						//load east bound
		add	r11, r5, r8							//set correct bound				
		
		cmp	r11, r10							//check correct bound
		bge	endRight							//branch if bound is present								
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in color of character		
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, =0x000000 						// color changed to black
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in black
		
		add r5, r5, r8							// add 1 "length" or 1 grid size from the character	in the x direction (ie right)							
		str r5, [r4]							// store the new xvalue in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
		
endRight:
		pop {r4-r12, lr}
		bx lr
		
moveDown:										// moves player down
		
		push {r4-r12, lr}						// push values to the stack
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		ldr	r10, =boundsInfo					
		ldr	r10, [r10, #16]						//load south bound
		add	r11, r6, r8							//set correct bound				
		
		cmp	r11, r10							//check correct bound
		bge	endDown								//branch if bound is present
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in color of character		
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, =0x000000 						// color changed to black
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in black
		
		add r6, r6, r8							// add 1 "length" or 1 grid size from the character	in the neg-y direction (ie down)						
		str r6, [r4, #4]						// store the new y-value in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
		
endDown:
		pop {r4-r12, lr}
		bx lr
		
		
moveUp:
		
		push {r4-r12, lr}
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		ldr	r10, =boundsInfo					
		ldr	r10, [r10, #4]						//load north bound
		sub	r11, r6, r8							//set correct bound				
		
		cmp	r11, r10							//check correct bound
		ble	endUp								//branch if bound is present
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in color of character		
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, =0x000000 						// color changed to black
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in black
		
		sub r6, r6, r8							// subtract 1 "length" or 1 grid size from the character in the y direction (ie up)	
		str r6, [r4, #4]						// store the new xvalue in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
		
endUp:			
		pop {r4-r12, lr}
		bx lr
		
startShoot:

		push {r4-r12, lr}

		ldr r5, [r4]     						// x value
		add	r5, #6								//bullet x value
		ldr r6, [r4, #4] 						// y value
		sub	r6, #6								//bullet y value

		ldr	r4, =PlayerBullet					//set object for movement to PlayerBullet
		str	r5, [r4]							//store bullet x pos to struct
		str	r6, [r4, #4]						//store bullet y pos to struct
		mov	r0, #1								//move presence flag value
		str	r0, [r4, #24]						//set bullet presence
		bl	moveRight							//draw bullet
		
		pop {r4-r12, lr}

<<<<<<< HEAD
>>>>>>> 460269df41933aa54da1939563cfd194a2d7af2e
=======
	bx lr
>>>>>>> 3bd42aacf1ec58a1e03b80098412e7a235ea7b79



