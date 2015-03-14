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
	//ldr r4, [r4]
	
	bl		ParseSNES

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

