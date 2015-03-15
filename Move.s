.section	.text
.globl		moveLeft





moveLeft:
		
		push {r4-r12, lr}
		
		ldr r5, [r4]     	// x value
		ldr r6, [r4, #4] 	// y value
		ldr r7, [r4, #16]	// color
		ldr r8, [r4, #8] 	// size
		ldr r9, [r4, #12] 	//speed
		
		bl delay
		bl drawSquare
		
see:		
		ldr r5, [r4]     	// x value
		ldr r6, [r4, #4] 	// y value
		ldr r7, =0x000000 	// color
		ldr r8, [r4, #8] 	// size
		ldr r9, [r4, #12] 	//speed
		
		bl delay
		bl drawSquare
		
test1:		
		sub r5, r5, r8
		str r5, [r4]
		ldr r7, [r4, #16]
		bl drawSquare
		
			
		pop {r4-r12, lr}
		bx lr



