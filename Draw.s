.section	.text
.globl		drawSquare
.globl		drawLine
.globl		clearScreen




drawSquare:
		push {lr}
		
		ldr r5, [r4]     // x value
		ldr r6, [r4, #4] // y value
		ldr r7, [r4, #16] // color
		ldr r8, [r4, #8] // size
		mov r9, #0
		mov r10, #0
		
squareLoop:

		bl	drawLine
		sub r6, #1
		add r10, #1
		cmp r8, r10
		BGT squareLoop			
		pop {lr}
		
		bx lr

drawLine:

	push {r5-r12, lr}
	
	

lineLoop:

	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl DrawPixel
	sub r5, #1
	add r9, #1	
	cmp r8, r9
	BGT lineLoop
	
	

breaking:	
	
	
	pop {r5-r12, lr}
	
	bx lr

	
	
