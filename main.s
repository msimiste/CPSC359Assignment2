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
	
west1:	
	ldr r5, =boundsInfo
	ldr r5, [r5, #16]

	bl initScreen
	
	bl beginLoop

test1:
	ldr	r0, =beginObjects
	ldr r1, =endCharacterObjects
	bl 	InitialStateLoop
	
	
/*	bl scoreScreen
	ldr r0, =pauseBoundsInfo
	bl drawPBack
	bl pauseScreen
	bl drawBounds
	ldr	r0, =pauseBoundsInfo*/
	
	

	//bl drawPauseBounds
	//bl startScreen
	ldr r9, =0x000fffff
	bl delay
	



	
	
	
	
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
