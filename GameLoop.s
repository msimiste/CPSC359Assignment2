.section .text
.globl ParseSNES
.globl updateBullet
.globl updateState

ParseSNES:

needBreak:

	push {lr}

	mov	r0, r12

	/*mov	r11, #1
	lsl	r11, #12
	ands	r11, r12
	bleq	startFun
	*/	


	ldr 	r11, =0xf7ff
	cmp 	r12, r11
	bleq	moveUp
	
	/*
	mov	r11, #1
	lsl	r11, #11
	ands	r11, r12
	bleq	moveUp*/
	
	
	
	ldr 	r11, =0xfbff
	cmp 	r12, r11
	bleq	moveDown
	
	
	
	//conlan code
	/*mov	r11, #1
	lsl	r11, #10
	ands	r11, r12
	bleq	moveDown */
	
	
	ldr 	r11, =0xfdff
	cmp 	r12, r11
	bleq	moveLeft
	
	//conlan code
	/*mov	r11, #1
	lsl	r11, #9
	ands	r11, r0 
	bleq	moveLeft*/
	
	
	ldr 	r11, =0xfeff
	cmp 	r12, r11
	bleq	moveRight
	
	//conlan code
	
	/*
	mov	r11, #1
	lsl	r11, #8
	ands	r11, r12
	bleq	moveRight*/
	
	
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
		ldr r0, [r4, #20]
		cmp	r0, #0
		beq	endUpdateBullet
		bl moveRight
		
endUpdateBullet:
		pop {lr}
		bx	lr
		
updateState:
			push {lr}
	
			ldr r4, =PlayerBullet
			bl removeObject
			pop {lr}
			bx lr

		
removeObject:
			push {r4, lr}
				
			ldr r5, [r4]     						// x value
			ldr r6, [r4, #4] 						// y value
			ldr r7, =0x000000 						// color changed to black
			ldr r8, [r4, #8] 						// size
			ldr r9, [r4, #20]						// check to see if object exists
			cmp	r9, #0								// if r9 == 0, object exists, if r9 =1 object does not exist
			
			beq drawBlack							// Object does not exist, draw black
			
			ldr	r10, =boundsInfo					
			ldr	r10, [r10, #12]						//load east bound
			add	r11, r5, #16						//set correct bound				
			cmp	r11, r10							//check correct bound
			blt	endRemove 
					

drawBlack:
		
		bl	drawSquare
		ldr	r5, =1000
		mov	r6, #30
		mov	r9, #0
		str	r5, [r4]
		str	r6, [r4, #4]
		str	r9, [r4, #20]
		
endRemove:
				
			pop {r4,lr}
			bx lr
				
					

