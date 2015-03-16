.section	.text
.globl		moveLeft
<<<<<<< HEAD

=======
.globl 		moveRight
.globl 		moveDown
.globl 		moveUp
>>>>>>> 460269df41933aa54da1939563cfd194a2d7af2e




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
		
		bl delay								// delays based on speed value ie  r9
		bl drawSquare							// draw square in color of character
		
see:		
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
		
			
		pop {r4-r12, lr}
		bx lr
		
moveDown:										// moves player to the right
		
		push {r4-r12, lr}						// push values to the stack
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
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
		
			
		pop {r4-r12, lr}
		bx lr
		
		
moveUp:
		
		push {r4-r12, lr}
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		ldr r9, [r4, #12] 						//speed
		
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
		
			
		pop {r4-r12, lr}
		bx lr
		

>>>>>>> 460269df41933aa54da1939563cfd194a2d7af2e



