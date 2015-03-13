.section    .init
.globl     _start

_start:
    b       main
    
.section .text

main:


    mov     sp, #0x8000	
	bl		EnableJTAG
	
	
	
		
	bl SNES	
	bl SNES_Input
	
	ldr r1, =SNES_Button
	str r12, [r1]
	
	bl InitFrameBuffer

test:
	
	
	
	
	//mov r0, #700 //x coordinate
	//mov r1, #400 // y coordinate
	
	//ldr r2, =0xcccc00
	//mov r5, #100
	//mov r6, #100
	
	ldr r10, =Player
	ldr r0, [r10]
	ldr r1, [r10, #4]
	ldr r2, [r10, #16]
	ldr r5, [r10, #8]
	ldr r6, [r10, #8]
	ldr r7, [r10, #12]

	bl drawSquare
	
	bl moveCheck
	
	//bl moveRight
	//bl moveLeft
	




    
haltLoop$:
	b		haltLoop$



.section .data
Player:
		.int 800 // x value
		.int 400 // y value
		.int 50  // size value
		.int 0x000fff00 // speed
		.int 0xcccc00 // color
		
SNES_Button:		
		.int 0 // button value


