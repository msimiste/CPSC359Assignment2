.section .text
.globl ParseSNES

ParseSNES:

	mov	r0, r12

	/*mov	r11, #1
	lsl	r11, #12
	ands	r11, r12
	bleq	startFun	

	mov	r11, #1
	lsl	r11, #11
	ands	r11, r12
	bleq	upFun
	
	mov	r11, #1
	lsl	r11, #10
	ands	r11, r12
	bleq	downFun*/	

leftTest:	
	mov	r11, #1
	lsl	r11, #9
	ands	r11, r0 
	bleq	moveLeft
	
	/*mov	r11, #1
	lsl	r11, #8
	ands	r11, r12
	bleq	rightFun
	
	mov	r11, #1
	lsl	r11, #7
	ands	r11, r12
	bleq	AFun*/			
	
	bx lr
	
startFun:

	bx lr
upFun:

	bx lr
downFun:

	bx lr
leftFun:

	bx lr
rightFun:

	bx lr
AFun:

	bx lr
