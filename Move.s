.section	.text
.globl		moveLeft
.globl 		moveRight




moveLeft:
		
		push {r4-r12, lr}
		
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
		
		sub r5, r5, r8							// subtract 1 "length" or 1 grid size from the character
		str r5, [r4]							// store the new xvalue in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
		
			
		pop {r4-r12, lr}
		bx lr
		
		
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
		
		add r5, r5, r8							// add 1 "length" or 1 grid size from the character							
		str r5, [r4]							// store the new xvalue in characters structure
		ldr r7, [r4, #16]						// load characters color into r7
		bl drawSquare							// draw square in color of character
		
			
		pop {r4-r12, lr}
		bx lr



