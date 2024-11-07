10 ' FTG Data Systems TEST
20 ' Version 2.00 (C)Copyright FTG Data Systems 1982
30 ' Licensed Material - Program Property of FTG Date Systems
40 ' Douglas E. Lippincott - programs author
50 '
60 ' SWITCH TO COLOR ADAPTER
70 DEF SEG=0 : POKE &H410, (PEEK(&H410) AND &HCF) OR &H10
80 SCREEN 1,0,0,0 : SCREEN 0 : WIDTH 40 : LOCATE ,,1,6,7
90 DEFINT A-Z : KEY OFF: CLS: LOCATE 1,1 : SCREEN 0,0,0,0 : WIDTH 80
100 DIM A(100)
110 '
120 ' CHECK IF CALLED BY MENU
130 DEF SEG=0 : READ A$ : FOR I=0 TO 10 : IF PEEK(&H4F0+I)<>ASC(MID$(A$,I+1,1))     THEN 160 ELSE NEXT I
140 WDTH=PEEK(&H4FE) : IF (WDTH<>40) AND (WDTH<>80) THEN 160
150 DRIVE$=CHR$(PEEK(&H4FD)) + ":" : GOTO 260
160 LOCATE 3,25 : PRINT "WHICH MODE OF TEST DO YOU WANT?"
170 PRINT : PRINT SPC(23);"GRAPHICS(TYPE G) OR ALPHA(TYPE A)"
180 A$=INKEY$ : IF A$="" THEN 180
190 IF (A$="G") OR (A$="g") THEN WDTH=40 : GOTO 240
200 IF (A$="A") OR (A$="a") THEN WDTH=80 : GOTO 240 ELSE 170
210 '
220 DATA "FTG IS HERE"
230 '
240 DRIVE$="A:"
250 '
260 COMPILE=0' SET THIS FLAG TO 1 FOR COMPILES AND 0 FOR INTERPRETIVE
270 '
280 DEF SEG : CLS : IF WDTH=40 THEN 470
290 PRINT "80 COLUMN TEXT MODE TEST"
300 PRINT
310 PRINT "COPYRIGHT(C) 1982 BY FTG DATA SYSTEMS, STANTON, CALIFORNIA."
320 PRINT
330 PRINT "This program will place the system into an 80 column text mode,"
340 PRINT "then flood the screen with solid white.  Touching the light"
350 PRINT "pen to any point will cause that cell to turn blank.
360 PRINT
370 PRINT "Note:  The area that turns black when touched is the smallest"
380 PRINT "detectable area in this mode."
390 PRINT
400 PRINT "This test shows the usable resolution of the pen, and may also"
410 PRINT "be used to test sensitivity of the pen by adjusting the brightness"
420 PRINT "control of the monitor.  If the area darkened is not exactly under"
430 PRINT "the pen, the FTG 'CALBRATE' program should be used (or if the"
440 PRINT "FTG interface routine has not been loaded, then the delays in"
450 PRINT "your system do not match those programmed into the IBM BIOS ROM)."
460 GOTO 670
470 PRINT "HI RESOLUTION GRAPHICS TEST"
480 PRINT
490 PRINT "COPYRIGHT(C) 1982 BY FTG DATA SYSTEMS, STANTON, CALIFORNIA."
500 PRINT
510 PRINT "This program will place the system into a high resolution graphics"
520 PRINT "mode, then flood the screen with solid white.  Touching the light"
530 PRINT "pen to any point will cause that cell to turn blank.
540 PRINT
550 PRINT "Note:  Although the IBM PC can address 640 by 200 pixels in the"
560 PRINT "hi-res graphics mode, the IBM light pen circuitry and software"
570 PRINT "can only resolve 40 by 100 cells.  The IBM bios returns the light"
580 PRINT "position in steps of 2 for Y and 16 for X.  The area that turns"
590 PRINT "black when touched is the smallest detectable area in this mode."
600 PRINT
610 PRINT "This test shows the usable resolution of the pen, and may also"
620 PRINT "be used to test sensitivity of the pen by adjusting the brightness"
630 PRINT "control of the monitor.  If the area darkened is not exactly under"
640 PRINT "the pen, the FTG 'CALBRATE' program should be used (or if the"
650 PRINT "FTG interface routine has not been loaded, then the delays in"
660 PRINT "your system do not match those programmed into the IBM BIOS ROM)."
670 LOCATE 24,1 : PRINT "Touch here ";CHR$(219);CHR$(219);" to continue:";
680 PEN ON : IF PEN(3)=0 THEN GOTO 680 ELSE IF PEN(8)<24 THEN 680 ELSE PEN OFF
690 IF WDTH=40 THEN SCREEN 2,0 ELSE SCREEN 0,0 : WIDTH WDTH
700 CLS
710 PEN ON
720 IF COMPILE=0 THEN 780
730 '
740 IF WDTH=80 THEN 760
750 FILL=VARPTR(A(0)) :BLOAD DRIVE$+"FLSCRG",FILL :CALL ABSOLUTE(FILL) :GOTO 820
760 FILL=VARPTR(A(0)) :BLOAD DRIVE$+"FLSCRA",FILL :I=0:CALL ABSOLUTE(I,FILL):GOTO 820
770 '
780 IF WDTH=40 THEN 800
790 FILL=VARPTR(A(0)) : BLOAD DRIVE$+"FLSCRA",FILL : I=0 : CALL FILL(I) : GOTO 820
800 FILL=VARPTR(A(0)) : BLOAD DRIVE$+"FLSCRG",FILL : CALL FILL
810 '
820 LOCATE 1,30 : PRINT " Press ESC to exit "
830 A$=INKEY$ : IF A$=CHR$(27) THEN 880 ELSE IF PEN(3)=0 THEN 830
840 IF WDTH=40 THEN 860 ELSE X=PEN(9) : Y=PEN(8) : IF Y>25 THEN Y=25
850 LOCATE Y,X,0 : PRINT CHR$(255); : GOTO 830
860 X = PEN(4): Y = PEN(5): LINE (X,Y) -(X+15,Y+1),0,BF
870 GOTO 830
880 MENU$="A:MENU" : RUN MENU$
