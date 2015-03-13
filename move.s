.section	.text

.globl moveUp
.globl moveDown
.globl moveRight
.globl moveLeft
.globl moveCheck




moveCheck:


	push {r0-r12, lr}
	ldr r0, =0xffff
	ldr r1, =0xfeff
	ldr r2, =0xfdff
	cmp r12, r0
moveTest:
	
	beq	testing
	cmp r12, r1
	popeq {r0-r12}
	bleq	moveRight
	cmp r12, r2
	popeq {r0-r12}
	bleq moveLeft
	
	
	
	
	
testing:
	
	pop {r0-r12, lr}
	bx lr

moveLeft:



	push {r0-r12, lr}
	
	//ldr r7, =0x00000010
	bl delay
	

	//ldr r2, =0xcccc00 // color setting	
	bl drawSquare
	//ldr r7, =0x00000010
    push {r2}
	bl delay
	ldr r2, =0x000000
	bl drawSquare
	sub r0, #10
	
	pop {r2}
	
	b moveLeft
	pop {r0-r12, lr}
		
	bx lr
	
	
moveRight:



	push {r0-r12, lr}
	
		
	bl delay	
	bl drawSquare	
    push {r2}
	bl delay
	ldr r2, =0x000000
	bl drawSquare
	add r0, #10
	
	pop {r2}
	
	b moveRight
	pop {r0-r12, lr}
		
	bx lr
