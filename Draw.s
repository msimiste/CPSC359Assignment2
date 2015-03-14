.section	.text
.globl		drawSquare
.globl		drawLine
.globl		clearScreen




drawSquare:
		push {r5-r12, lr}	

		mov r9, #0			// initialize the counter
		mov r10, #0			// initialize counter #2
		
squareLoop:					// begin squareloop

		bl	drawLine 	 	// branch to draw line
		sub r6, #1			// sutract 1 from the y value
		add r10, #1			// add 1 to the counter
		cmp r8, r10			// compare the counter to size
		BGT squareLoop		// while counter < size branch to square loop		
		
		pop {r5-r12, lr}
		
		bx lr

drawLine:

		push {r5-r12, lr}	

lineLoop:

		mov r0, r5  // x value
		mov r1, r6  // y value
		mov r2, r7	// color value
		bl DrawPixel  //draw a pixel
		sub r5, #1	// decrease the x va;ie
		add r9, #1	// increase the counter
		cmp r8, r9	// compare the counter to size
		BGT lineLoop // while counter > size continue to draw pixels	
		
		
		pop {r5-r12, lr}
		
		bx lr

	
	
