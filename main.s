.section    .init
.globl     _start
.globl 		haltLoop$

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

	bl initScreen
	
	bl beginLoop

	ldr	r0, =beginObjects
	ldr r1, =endCharacterObjects
	bl 	InitialStateLoop
	
	ldr r9, =0x000fffff
	bl delay
	
mainLoop:
	ldr r9, =0x000fffff
	bl delay
	
	bl SNES_Input
	
	ldr r1, =SNES_Button
	
	str r12, [r1]
	
	ldr r4, =Player
	
	bl		ParseSNES
	
	ldr	r0, =beginComputerObjects
	ldr	r1, =endCharacterObjects
	bl computerMoveLoop
	
	bl compStartShoot
	
	bl updateBullet
	
	bl updateState
	
	b mainLoop


haltLoop$:
	b		haltLoop$
	
.section .data
