.section	.text
.globl		drawSquare
.globl		drawLine
.globl		clearScreen
.globl 		drawBounds



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
		
drawBounds:

			push {lr}
			
	
			ldr r9, =boundsInfo
			ldr r4, [r9]  // x value
			ldr r5, [r9, #4] // y value
			ldr r6, [r9, #8]	// y2 value
			ldr r10, [r9, #16]  // y 3 value
			ldr r7, =0x66FF66 // set color
			ldr r8, [r9, #12]	// east boundary
			 
	
drawHoriz:

			mov r0, r4			//x value
			mov r1, r5			// y value
			mov r2, r7		// color value					
			bl DrawPixel	//draw a pixel
			mov r0, r4			//x value
			mov r1, r6
			mov r2, r7		// color value			
			bl DrawPixel	// draw a pixel
			mov r0, r4			//x value
			mov r1, r10
			mov r2, r7	
			bl DrawPixel			
			add r4, #1		// increase the x value
			cmp	r4, r8		// check to see if x is out of bounds	
			bne	drawHoriz 
			
			

		
			ldr r4, [r9]  // x value
			ldr r5, [r9] // y value
drawVert:			
			mov r0, r4			//x value
			mov r1, r5			// y value
			mov r2, r7		// color value					
			bl DrawPixel	//draw a pixel
			mov r0, r8			//x value
			mov r1, r5
			mov r2, r7		// color value			
			bl DrawPixel	// draw a pixel
			add r5, #1		// increase the x value
			cmp	r5, r10		// check to see if x is out of bounds	
			bne	drawVert
			
			

			
			pop {lr}
			bx lr
	
	
