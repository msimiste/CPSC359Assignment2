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
	
	//bl initScreen
	
	bl scoreScreen
	ldr r0, =pauseBoundsInfo
	bl drawPBack
	bl pauseScreen
	bl drawBounds
	ldr	r0, =pauseBoundsInfo
	

	bl drawPauseBounds
	//bl startScreen
	



	bl SNES
	
	
	
mainLoop:
	ldr r9, =0x000fffff
	bl delay
	
	bl SNES_Input
	
checkInput:

	
	ldr r1, =SNES_Button
	
	str r12, [r1]
	
	ldr r4, =Player
	
	bl		ParseSNES
	
	bl updateBullet
	
	
	
	bl updateState
	
	b mainLoop


haltLoop$:
	b		haltLoop$
	
.section .data
