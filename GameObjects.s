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
		.int 83 //'S'
		.int 67 //'C'
		.int 79	//'O'
		.int 82 //'R'
		.int 69 //'E'
		.int 58 //':'
endScoreInfo:

TitleInfo:
		.int 66	/*B*/ , 89 //Y	
		.int 58 //:
		.int 32 // <space> 
		.int 77 //M
		.int 73 //I
		.int 75 //K
		.int 69 //E
		.int 32 //<space>
		.int 83 //S
		.int 73 //I
		.int 77 //M
		.int 73 //I
		.int 83 //S
		.int 84 //T
		.int 69 //E
		.int 82 //R
		.int 32 //<space>
		.int 38 //&
		.int 32 //
		.int 67 // C
		.int 79 //O
		.int 78 //N
		.int 76 //L
		.int 65 //A
		.int 78 //N
		.int 32 //<space>
		.int 72 //H
		.int 65 //A
		.int 78 //N
		.int 87 //W
		.int 69 //E
		.int 76 //L
		.int 76 //L
endTitleInfo:

StartInfo:

		
		.int 80 //P
		.int 82 //R
		.int 69 //E
		.int 83 //S
		.int 83 //S
		.int 32 //<space>
		.int 83 //S
		.int 84 //T
		.int 65 //A
		.int 82 //R
		.int 84 //T
		
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
