.section .text
.globl Player
.globl beginObjects
.globl endObjects
.globl endCharacterObjects
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
.globl gameNameInfo
.globl endGameNameInfo
.globl continueColor
.globl newColor
.globl quitColor
.globl beginComputerObjects
.globl computerDirectionInfo
.globl computerShootInfo
.globl beginComputerBulletObjects
.globl beginBulletObjects
.globl Pawn1Bullet



.section .data
beginObjects:
Player:
		.int 16 // SE x value
		.int 47 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xcccc00 // color
		.int 1 // player present..  1 = present 0= not present
		.int 48 // SE init x value
		.int 47 // SE init y value

beginComputerObjects:		
Pawn1:
		.int 928 // SE x value 
		.int 47 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 47 // SE y valuelue
Pawn2:
		.int 928 // SE x value 
		.int 95 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 95 // SE y value
		
Pawn3:
		.int 928 // SE x value 
		.int 143 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 143 // SE y value
		
Pawn4:
		.int 928 // SE x value 
		.int 191 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 191 // SE y value
Pawn5:
		.int 928 // SE x value 
		.int 239 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 239 // SE y value
		
Pawn6:
		.int 928 // SE x value 
		.int 287 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 287 // SE y valuelue
		
Pawn7:
		.int 928 // SE x value 
		.int 335 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 335 // SE y valuelue
Pawn8:
		.int 928 // SE x value 
		.int 383 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 383 // SE y valuelue
		
Pawn9:
		.int 928 // SE x value 
		.int 431 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 431 // SE y valuelue
		
Pawn10:
		.int 928 // SE x value 
		.int 479 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xADD8E6// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 928 // SE x value 
		.int 479 // SE y value
		
Knight1:
		.int 960 // SE x value 
		.int 63 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xA52A2A// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 960 // SE x value 
		.int 63 // SE y value
Knight2:
		.int 960 // SE x value 
		.int 159 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xA52A2A// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 960 // SE x value 
		.int 159 // SE y value
Knight3:
		.int 960 // SE x value 
		.int 255 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xA52A2A// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 960 // SE x value 
		.int 255 // SE y value
Knight4:
		.int 960 // SE x value 
		.int 351 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xA52A2A// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 960 // SE x value 
		.int 351 // SE y value
Knight5:
		.int 960 // SE x value 
		.int 447 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0xA52A2A// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 960 // SE x value 
		.int 447 // SE y value
		
Queen1:

		.int 992 // SE x value 
		.int 111 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0x4135B5// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 992 // SE x value 
		.int 111 // SE y value
Queen2:

		.int 992 // SE x value 
		.int 399 // SE y value
		.int 16  // size value
		.int 16 // speed
		.int 0x4135B5// color
		.int 1 // pawn present..  1 = present 0= not present
		.int 992 // SE x value 
		.int 399 // SE y value
		
endCharacterObjects:
beginBulletObjects:

PlayerBullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xcccc00 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
beginComputerBulletObjects:

Pawn1Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn2Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn3Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn4Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn5Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn6Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn7Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn8Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn9Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Pawn10Bullet:
		.int 1119 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xADD8E6 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Knight1Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xA52A2A // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Knight2Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xA52A2A // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Knight3Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xA52A2A // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Knight4Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xA52A2A // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Knight5Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0xA52A2A // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Queen1Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0x4135B5 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
Queen2Bullet:
		.int 500 // SE x value
		.int 500 // SE y value
		.int 4 //bullet size
		.int 16 // speed
		.int 0x4135B5 // color
		.int 0 //bullet present.. 1 = present 0= not present
		.int 500 // SE init x value
		.int 500 // SE init y value
		
endObjects:		
		
		
		
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
		.int 265 //y1 val	
		.int 567 //x2 val	
		.int 417 //y2 val
		.int 0x66FF66 // set color
		.int 152 //size
			
scoreInfo:
		.int 83, 67, 79, 82, 69, 58 // S C O R E :
		.int 0x100 // total
		
endScoreInfo:

gameNameInfo:
			.int 66, 76, 79, 67, 75, 65, 68, 69 // B L O C K A D E

endGameNameInfo:

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

continueColor:
			.int 0x0000f8

NewInfo:
			.int 78, 69, 87, 32, 71, 65, 77, 69 // N E W  G A M E
		
endNewInfo:

newColor:
			.int 0xfFcc

QuitInfo:
			.int 81, 85, 73, 84 // Q U I T	
			
endQuitInfo:

quitColor:
			.int 0xfFcc

GameWon:
			.int 89, 79, 85, 32, 87, 73, 78, 33, 33, 33 // Y O U  W I N ! ! !
endGameWon:

GameLost:
			.int 71, 65, 77, 69, 32, 79, 86, 69, 82 // G A M E  O V E R

endGameLost:

ScoreOnes:
		.int '#0'	// initial
		//.int 5	// pawn increment/decrement
		//.int 10 // rook increment/decrement
		//.int 100 // queen increment/decrement

endScoreOnes:

ScoreTens:
		.int '#5' // initial

endScoreTens:

ScoreHuns:

endScoreHuns:

Rook:
	.int 0 // initial health
	.int 5 // decremen/damage
	.int 10 // max health
endRook:

Queen:
	.int 0 // initial health
	.int 20 // decrement/ damage
	.int 100 // max health
endQueen:

computerDirectionInfo:
	.int 0 //direction value (0 = down, 1 = forward at bottom, 2 = up, 3 = forward at top )
	.int 17 //max north/south movements
	.int 1 //max west movement
	.int 0 //current movement
	.int 0 //intial reset value
	
computerShootInfo:
	.int	Pawn1Bullet, beginComputerObjects

