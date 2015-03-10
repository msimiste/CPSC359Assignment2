.section	.text
.globl		drawSquare
.globl		drawLine




drawSquare:
	
	push {r1, lr}	
	mov r6, #100 // counter2

drawSquareLoop:
	
	bl drawLine // draw 1 line
	sub	r1, #1 // add one to x coordinate
	sub r6, #1 // subtract counter by 1
	cmp r6, #0 //compare counter to 0
	
	bge drawSquareLoop // loop
	
	pop {r1, lr}
	bx lr

	


drawLine:

	push {r0, lr}	
	mov r5, #100 // counter
	
	
drawLineLoop:
	
	bl DrawPixel // draw 1 pixel
	
	add	r0, #1 // add one to x coordinate
	sub r5, #1 // subtract counter by 1
	cmp r5, #0 //compare counter to 0
	
	bge drawLineLoop // loop
	
	pop {r0, lr}
	bx lr
	

	
	


	
	
	
	
