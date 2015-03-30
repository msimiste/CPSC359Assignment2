.section	.text
.globl	drawSquare
.globl	drawLine
.globl	clearScreen
.globl drawBounds
.globl DrawChar
.globl drawPauseBounds
.globl drawPBack
.globl drawPBlack
.globl forceDrawCharacter

drawPBlack:

		push {r4, lr}		
		
		ldr	r5, [r0, #8] //x value
		ldr	r6, [r0, #12] //y value
		ldr	r7, =0x0000 //color
		ldr	r8, [r0, #20] //size
		bl drawSquare
		
		
		pop {r4, lr}
		bx lr

drawSquare:						//r0 = x val, r1 = y val, r7 = color val, r8 = size val

		push {r4-r12, lr}
		mov r9, #0 				// initialize the counter
		mov r10, #0 			// initialize counter #2
squareLoop: 					// begin squareloop
		bl	drawLine 			// branch to draw line
		sub r6, #1 				// sutract 1 from the y value
		add r10, #1 			// add 1 to the counter
		cmp r8, r10 			// compare the counter to size
		BGT squareLoop			 // while counter < size branch to square loop
			
		pop {r4-r12, lr}
		bx lr
		
drawLine:

		push {r4-r12, lr}
lineLoop:
		mov r0, r5				// x value
		mov r1, r6 				// y value
		mov r2, r7 				// color value
		bl DrawPixel 			//draw a pixel
		sub r5, #1 				// decrease the x value
		add r9, #1 				// increase the counter
		cmp r8, r9 				// compare the counter to size
		BGT lineLoop 			// while counter > size continue to draw pixels
		
		pop {r4-r12, lr}
		bx lr
		
forceDrawCharacter:

		push {r4-r12, lr}
		
		mov	r4, r0			//player adress
		
		ldr r5, [r4]     						// x value
		ldr r6, [r4, #4] 						// y value
		ldr r7, [r4, #16]						// color
		ldr r8, [r4, #8] 						// size
		bl drawSquare
		
		pop {r4-r12, lr}
		bx	lr

		
		
	
		
drawBounds:

		push {lr}
	
west3:
	ldr r5, =boundsInfo
	ldr r5, [r5, #16]
	
		ldr r9, =boundsInfo
		ldr r4, [r9] 			// x value
		ldr r5, [r9, #4] 		// y value
		ldr r6, [r9, #8] 		// y2 value
		ldr r10, [r9, #16] 		// y 3 value
		ldr r7, =0x66FF66 		// set color
		ldr r8, [r9, #12] 		// east boundary
drawHoriz:

		mov r0, r4 				//x value
		mov r1, r5 				// y value
		mov r2, r7 				// color value
		bl DrawPixel 			//draw a pixel
		mov r0, r4 				//x value
		mov r1, r6
		mov r2, r7 				// color value
		bl DrawPixel 			// draw a pixel
		mov r0, r4 				//x value
		mov r1, r10
		mov r2, r7
		bl DrawPixel
		add r4, #1 				// increase the x value
		cmp	r4, r8 				// check to see if x is out of bounds
		bne drawHoriz
		ldr r4, [r9] 			// x value
		ldr r5, [r9] 			// y value
		
drawVert:
		mov r0, r4 				//x value
		mov r1, r5 				// y value
		mov r2, r7 				// color value
		bl DrawPixel 				//draw a pixel
		mov r0, r8 				//x value
		mov r1, r5
		mov r2, r7 				// color value
		bl DrawPixel 			// draw a pixel
		add r5, #1 				// increase the x value
		cmp	r5, r10 			// check to see if x is out of bounds
		bne drawVert
		
		pop {lr}
		bx lr
		
drawPauseBounds:

	push {r4, lr}	//r0 = data struct address
	
		mov	r9, r0	//address save
		ldr	r4, [r0] //x1 value
		ldr	r5, [r0, #4] //y1 value
		ldr	r6, [r0, #8] //x2 value
		ldr	r7, [r0, #12] //y2 value
		ldr	r8, [r0, #16] //colour

		
drawPHoriz:	
		mov r0, r4 				//x value
		mov r1, r5 				// y value
		mov r2, r8 				// color value
		bl DrawPixel 			//draw a pixel
		mov r0, r4 				//x value
		mov r1, r7 				// y value
		mov r2, r8 				// color value
		bl DrawPixel 			//draw a pixel
		add r4, #1 				// increase the x value
		cmp	r4, r6 				// check to see if x is out of bounds
		bne drawPHoriz
		

		ldr r4, [r9] 			// x value
		ldr r5, [r9, #4] 			// y value
		
drawPVert:
		mov r0, r4 				//x1 value
		mov r1, r5 				// y1 value
		mov r2, r8 				// color value
		bl DrawPixel 			//draw a pixel
		mov r0, r6 				//x2 value
		mov r1, r5
		mov r2, r8 				// color value
		bl DrawPixel 			// draw a pixel
		add r5, #1 				// increase the x value
		cmp	r5, r7 			// check to see if x is out of bounds
		bne drawPVert
	
	pop	{r4, lr}
	bx lr
	
drawPBack:

		push {lr}		
		
		ldr	r5, [r0, #8] //x value
		ldr	r6, [r0, #12] //y value
		ldr	r7, =0x0000 //color
		ldr	r8, [r0, #20] //size
		bl drawSquare
		
		
		pop {lr}
		bx lr
		

	
DrawChar:
	push	{r4-r10, lr}		//r0 = int value of char, r1 = colour, r2 = x coord, r3 = y coord

	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	mov		r9, r2
	mov		r10, r1
	//mov		r11, 

	ldr		chAdr,	=font		// load the address of the font map
	//ldr		r0,		r4		// load the character into r0
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)

	mov		py,		r3			// init the Y coordinate (pixel coordinate)

charLoop$:
	mov		px,		r9			// init the X coordinate

	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	
	ldrb	row,	[chAdr], #1	// load the row byte, post increment chAdr

rowLoop$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel$

	mov		r0,		px

	mov		r1,		py
	mov		r2,		r10			// red
	bl		DrawPixel			// draw red pixel at (px, py)


noPixel$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 

	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop$

	add		py,		#1			// increment y coordinate by 1

	tst		chAdr,	#0xF
	bne		charLoop$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)

	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask


	pop		{r4-r10, pc}
	bx	lr

.section .data

.align 4
font:		.incbin	"font.bin"


	
