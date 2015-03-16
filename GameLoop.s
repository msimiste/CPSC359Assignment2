.section .text
.globl ParseSNES
.globl updateBullet

ParseSNES:

	push {lr}

	mov	r0, r12

	/*mov	r11, #1
	lsl	r11, #12
	ands	r11, r12
	bleq	startFun
	*/	


	
	mov	r11, #1
	lsl	r11, #11
	ands	r11, r12
	bleq	moveUp
	
	mov	r11, #1
	lsl	r11, #10
	ands	r11, r12
	bleq	moveDown
	
	mov	r11, #1
	lsl	r11, #9
	ands	r11, r0 
	bleq	moveLeft
	
	mov	r11, #1
	lsl	r11, #8
	ands	r11, r12
	bleq	moveRight
	
	
	mov	r11, #1
	lsl	r11, #7
	ands	r11, r12
	bleq	startShoot	
			
	pop	{lr}
	bx lr
	
startFun:

	bx lr
	
updateBullet:
	
		push {lr}

		ldr r4, =PlayerBullet
		ldr r0, [r4, #24]
		cmp	r0, #0
		beq	endUpdateBullet
		bl moveRight
		
endUpdateBullet:
		pop {lr}
		bx	lr
