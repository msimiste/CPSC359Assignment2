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
	
	bl drawBounds

	bl SNES
	
	
	
mainLoop:
	bl SNES_Input
	
	ldr r1, =SNES_Button
	
	str r12, [r1]
	
	ldr r4, =Player
	
	bl		ParseSNES
	
	bl updateBullet
	
	b mainLoop


haltLoop$:
	b		haltLoop$
	
.section .data


