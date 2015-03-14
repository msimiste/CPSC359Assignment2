.section    .init
.globl     _start

_start:
    b       main
    
.section .text

main:


    mov     sp, #0x8000	
	bl		EnableJTAG
		
	bl InitFrameBuffer
	cmp r0, #0
	beq haltLoop$
	
	bl SNES	
	
	bl SNES_Input
	
	ldr r1, =SNES_Button
	
	str r12, [r1]	
	
	ldr r4, =Player

temptest1:
	bl moveLeft
	ldr r4, =Player
	ldr r4, [r4]
	ldr	r5,	=750
	cmp	r4, r5 
	bne temptest1

	ldr r4, =Player
	//ldr r0, [r10]     // x value
	//ldr r1, [r10, #4] // y value
	//ldr r2, [r10, #16] // color
	//ldr r3, [r10, #12] // size
	//ldr r5, [r10, #8]
	//ldr r6, [r10, #8]
	//bl	drawSquare
	bl moveLeft
	
	
	ldr r4, =Player
	ldr r4, [r4]
	
	




haltLoop$:
	b		haltLoop$    




.section .data
Player:
		.int 800 // NE x value
		.int 400 // NE y value
		.int 50  // size value
		.int 0x000fff00 // speed
		.int 0xcccc00 // color

		
SNES_Button:		
		.int 0 // button value

