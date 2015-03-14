
.section	.text
.globl		SNES
.globl		SNES_Input
.globl		wait
.globl		delay

SNES:

		// init clock

		push {lr}
		
		ldr r0, =0x20200004 // address for  GPFSEL1
		ldr r1, [r0] // copy GPFSEL1
		mov r2, #7 // (bo111)
		lsl r2, #3 // index of 1st bit for pin 11, r2 = 0 111 000
		bic r1, r2 // clear pin 11 bits
		mov r3, #1 // output function code
		lsl r3, #3 // r3 - 0 001 000
		orr r1, r3 // set pin 11 function in r1
		str r1, [r0] // write back to GPFSEL1

		// init latch
		ldr r0, =0x20200000 // address for  GPFSEL1
		ldr r1, [r0] // copy GPFSEL1
		mov r2, #7 // (bo111)
		lsl r2, #27 // index of 1st bit for pin 11, r2 = 0 111 000
		bic r1, r2 // clear pin 09 bits
		mov r3, #1 // output function code
		lsl r3, #27 // r3 - 0 001 000
		orr r1, r3 // set pin 09 function in r1
		str r1, [r0] // write back to GPFSEL1
		
		// init data
		ldr r0, =0x20200004 // address for  GPFSEL1
		ldr r1, [r0] // copy GPFSEL1
		mov r2, #7 // (bo111)
		bic r1, r2 // clear pin 10 bits setting data pin to input (to core)
		str r1, [r0] // write back to GPFSEL1
		
		pop {lr}
		bx lr
	
	
SNES_Input:

		push {lr}
		
		//button .req r12
		mov	r12, #0	
		
		// write 1 to clock	
		mov r0, #11		
		ldr r2, =0x2020001C
		mov r1, #1
		lsl r1, r0	
		str r1, [r2]
		
		// write to latch	 		
		mov r0, #9
		ldr r2, =0x2020001C
		mov r1, #1
		lsl r1, r0	
		str r1, [r2]
		
		mov r6, #12
		bl wait
		
		// write to clear latch		 
		mov r0, #9					
		ldr r2, =0x20200028
		mov r1, #1
		lsl r1, r0	
		str r1, [r2]
		
		mov r5, #0 			//setting counter i = 0
		bl pulseLoop
		
		pop {lr}
		bx lr




	
	
	
pulseLoop:	

		push {lr}
		
		mov	r6, #6
		bl wait
		
		// write to clear  clock
		mov r0, #11
		ldr r2, =0x20200028
		mov r1, #1
		lsl r1, r0	
		str r1, [r2]
		mov	r6, #6
		bl wait// wait 6 seconds
		
		// read data
		mov r0, #10
		ldr r2, =0x20200034
		ldr r1, [r2]
		mov r3, #1
		lsl r3, r0
		and r1, r3
		teq	r1, #0
		
		moveq r4, #0
		movne r4, #1
		
		orr	r12, r4
		
		// write to set  clock
		mov r0, #11
		ldr r2, =0x2020001C
		mov r1, #1
		lsl r1, r0	
		str r1, [r2]
		
		add	r5, #1
		cmp	r5, #15
		
		BGT exit
		lsl r12, #1	
		b pulseLoop
	
exit:
		
		pop {lr}
		bx lr


wait:

		push {lr}
		
		ldr r0, =0x20003004
		ldr r1, [r0]
		add r1, r6
		waitLoop:
			ldr r2, [r0]
			cmp r1, r2
			bhi	waitLoop
		
		pop {lr}
		bx lr
	
delay:				// delay loop

	
	push {r9, lr}
	
del1:	
	subs r9, #1			
	bne	del1
	
	
	pop {r9, lr}	
	bx lr
	
	

