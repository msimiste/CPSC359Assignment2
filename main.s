.section    .init
.globl     _start

_start:
    b       main
    
.section .text

main:


    mov     sp, #0x8000	
	bl		EnableJTAG

	///bl SNES
	//bl SNES_Input
	
	bl InitFrameBuffer
	mov r0, #500 //x coordinate
	mov r1, #400 // y coordinate

	ldr r2, =0xcccc00 // color setting
	
	bl drawSquare
	
	mov r0, #500 //x coordinate
	mov r1, #400 // y coordinate

	ldr r2, =0x000000 // color setting
	bl drawSquare
	
	ldr r6, = 0x0ffff
	//bl wait
	//


    
haltLoop$:
	b		haltLoop$



.section .data

