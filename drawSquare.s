.section	.text
.globl		drawSquare
.globl		drawLine
.globl		clearScreen




drawSquare:

	
	
	push {r0-r7, lr}	
	//mov r6, #100 // counter2

drawSquareLoop:
	
	bl drawLine // draw 1 line
	sub	r1, #1 // add one to x coordinate
	sub r6, #1 // subtract counter by 1
	cmp r6, #0 //compare counter to 0
	
	bge drawSquareLoop // loop
	
	pop {r0-r7,lr}
	bx lr

	


drawLine:

	push {r0-r7, lr}	
	//mov r5, #100// counter
	
	
drawLineLoop:
	
	bl DrawPixel // draw 1 pixel
	
	add	r0, #1 // add one to x coordinate
	sub r5, #1 // subtract counter by 1
	cmp r5, #0 //compare counter to 0
	
	bge drawLineLoop // loop
	
	pop {r0-r7, lr}
	bx lr
	
	

clearScreen:

	push {r0, r1, lr}

	mov r1, #0
	mov r0, #0
	
	mov r6, #1020	
	ldr r5, =0x2f8
	
	ldr r2, =0x000000
	
	bl drawSquare
	
	pop {r0, r1, lr}
	bx lr
	

	
	


	
	
	
	
