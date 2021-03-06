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
	
	ldr	r0,	=beginBarriers
	ldr	r1,	=endBarriers
	//ldr r2, =beginComputerObjects
	bl	barrierHit
	
	ldr	r0, =PlayerBullet
	ldr r1, =beginComputerObjects		//address of beginning computer players
	ldr r2, =endCharacterObjects		//address of end computer players
	bl	playerBulletHits

	ldr	r0, =beginComputerBulletObjects
	ldr	r1, =endObjects
	ldr	r2, =Player
	bl	computerBulletHits
	
	ldr	r0, =beginComputerObjects
	ldr	r1, =endCharacterObjects
	ldr	r2, =Player
	bl	computerPlayerCollision
	
	
	
	ldr	r0, =beginBarriers
	ldr	r1, =endCharacterObjects
	bl	killNoHardness
	
	ldr	r0, =beginComputerObjects
	ldr	r1, =endCharacterObjects
	bl computerMoveLoop
	
	bl compStartShoot
		
	bl updateBullet
	
	bl updateState
	
	ldr	r0, =Player
	bl forceDrawCharacter
	
	bl	drawScoreBlack
	bl	calcScore
	bl	parseScore
	bl	drawScore
	
	bl checkEndCondition
	
	b mainLoop


haltLoop$:
	b		haltLoop$
	
.section .data
