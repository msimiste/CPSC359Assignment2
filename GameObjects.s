.section .text
.globl Player
.globl SNES_Button
.globl boundsInfo
.globl PlayerBullet





















.section .data
Player:
		.int 48 // SE x value
		.int 47 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xcccc00 // color
		.int 1 // player present..  1 = present 0= not present

PlayerBullet:
		.int 0 // SE x value
		.int 0 // SE y value
		.int 4 //bullet size
		.int 32 // speed
		.int 0xcccc00 // color
		.int 0 //bullet present.. 1 = present 0= not present
		
		

		
SNES_Button:		
		.int 0 // button value
		
boundsInfo:		
			.int 0 /// top
			.int 31 // North Boundary
			.int 0 // West Boundary
			.int 1009 // East Boundary
			.int 752	// South Boundary
			.int 0x66FF66 // set color
			

		


		
