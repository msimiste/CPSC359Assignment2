.section .text
.globl Player
.globl SNES_Button
.globl boundsInfo





















.section .data
Player:
		.int 48 // SE x value
		.int 47 // SE y value
		.int 16  // size value
		.int 0x000fffff // speed
		.int 0xcccc00 // color

		
SNES_Button:		
		.int 0 // button value
		
boundsInfo:		
			.int 0 /// top
			.int 31 // North Boundary
			.int 0 // West Boundary
			.int 1009 // East Boundary
			.int 752	// South Boundary
			.int 0x66FF66 // set color
		
