.section .text
.globl Player
.globl SNES_Button
.globl boundsInfo
.globl PlayerBullet
.globl scoreInfo
.globl endScoreInfo
.globl TitleInfo
.globl endTitleInfo
.globl StartInfo
.globl endStartInfo
.globl PauseInfo
.globl endPauseInfo
.globl ContinueInfo		
.globl endContinueInfo
.globl NewInfo			
.globl endNewInfo
.globl QuitInfo			
.globl endQuitInfo
.globl GameWon
.globl endGameWon
.globl GameLost
.globl endGameLost
.globl pauseBoundsInfo


.section .data
Player:
		.int 48 // SE x value
		.int 47 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xcccc00 // color
		.int 1 // player present..  1 = present 0= not present

PlayerBullet:
		.int 4 // SE x value
		.int 4 // SE y value
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
		
pauseBoundsInfo:
		.int 415 //x1 val 
		.int 290 //y1 val	
		.int 567 //x2 val	
		.int 442 //y2 val
		.int 0x66FF66 // set color
		.int 152 //size
			
scoreInfo:
		.int 83, 67, 79, 82, 69, 58 // S C O R E :
		
endScoreInfo:

TitleInfo:
		.int 66, 89, 58, 32, 77, 73, 75, 69, 32, 83, 73, 77, 73, 83, 84, 69, 82, 32, 38
		.int 32, 67, 79, 78, 76, 65, 78, 32, 72, 65, 78, 87, 69, 76, 76 //B Y  M I K E  S I M I S T E R  &   C O N L A N   H A N W E L L

endTitleInfo:

StartInfo:

		
		.int 80, 82, 69, 83, 83, 32, 83, 84, 65, 82, 84 //P R E S S  S T A R T

endStartInfo:


PauseInfo:

			.int 80, 65, 85, 83, 69, 68 // P A U S E D			 		

endPauseInfo:

ContinueInfo:

			.int 67, 79, 78, 84, 73, 78, 85, 69 // C O N T I N U E
endContinueInfo:

NewInfo:
			.int 78, 69, 87, 32, 71, 65, 77, 69 // N E W  G A M E
			
endNewInfo:

QuitInfo:
			.int 81, 85, 73, 84 // Q U I T	
			
endQuitInfo:

GameWon:
			.int 89, 79, 85, 32, 87, 73, 78, 33, 33, 33 // Y O U  W I N ! ! !
endGameWon:

GameLost:
			.int 71, 65, 77, 69, 32, 79, 86, 69, 82 // G A M E  O V E R

endGameLost:
