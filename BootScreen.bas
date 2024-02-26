   10 REM ******************************
   20 REM *         AGON LIGHT 2       *
   30 REM *         BOOT SCREEN        *
   40 REM *         VERSION 2.0        *
   50 REM *      BY STEVE LOVEJOY      *
   60 REM *   ICON BY ARNOLD MESZAROS  *
   70 REM ******************************
   80 :
   90 DIM VDP_ARRAY(31) : DIM MOS_ARRAY(31)
   95 ANYKEY%=INKEY(200) : REM DELAY TO MAKE SURE VERSION INFO ON SCREEN (tweak me, try lower until vdp & mos info disappear's).
  100 PROC_READ_CHARS(0,0,1)
  110 PROC_READ_CHARS(0,1,2)
  120 REM M% = 8 : BorM$ = "M" : GOTO 300 : REM UNCOMMENT TO SET YOUR DEFAULTS.
  130 PRINT TAB(3,4) "MODE  0 = 80x60: 16 colours (640x480) 60hz"
  140 PRINT TAB(3,5) "MODE  1 = 80x60:  4 colours (640x480) 60hz"
  150 PRINT TAB(3,6) "MODE  2 = 80x60:  2 colours (640x480) 60hz"
  160 PRINT TAB(3,7) "MODE  3 = 80x30: 64 colours (640x240) 60hz"
  170 PRINT TAB(3,8) "MODE  4 = 80x30: 16 colours (640x240) 60hz"
  180 PRINT TAB(3,9) "MODE  5 = 80x30:  4 colours (640x240) 60hz"
  190 PRINT TAB(3,10) "MODE  6 = 80x30:  2 colours (640x240) 60hz"
  200 PRINT TAB(3,11) "MODE  7 = 40x25: 16 colours (320x240) 60hz (orig bbc teletext mode)"
  210 PRINT TAB(3,12) "MODE  8 = 40x30: 64 colours (320x240) 60hz"
  220 PRINT TAB(3,13) "MODE  9 = 40x30: 16 colours (320x240) 60hz"
  230 PRINT TAB(3,14) "MODE 10 = 40x30:  4 colours (320x240) 60hz"
  240 PRINT TAB(3,15) "MODE 11 = 40x30:  2 colours (320x240) 60hz"
  250 PRINT TAB(3,16) "MODE 12 = 40X25: 64 colours (320x200) 70hz"
  260 :
  270 COLOUR 2
  280 INPUT TAB(3,20)"PICK A SCREEN MODE"; M%
  290 INPUT TAB(3,20)"B FOR BASIC PROMPT (>) or M FOR MOS PROMPT (*) "; BorM$
  300 PROC_INITIALIZE
  310 PROC_LOAD_LOGO
  320 PROC_DRAW_LOGO
  330 PROC_INFO_TEXT
  340 PROC_DRAW_COLOUR_PALETTE
  350 PROC_READYUP
  360 :
  370 NEW : REM CLEAR PROGRAM FROM MEMORY.
  380 REM END OF PROGRAM.
  390 :
  500 DEF PROC_DRAW_LOGO : REM **** DRAW_LOGO ****
  510 REM DISPLAY THE LOGO LINE BY LINE.
  520 COLOUR 14 : IF C% = 2 THEN COLOUR 14 + 1
  530 PRINT TAB(1,1);"  ";CHR$(200);CHR$(201);"   ";
  540 PRINT TAB(1,2);"  ";CHR$(202);CHR$(203);"   ";
  550 PRINT TAB(1,3);" ";CHR$(204);CHR$(205);CHR$(206);CHR$(207);"  ";
  560 PRINT TAB(1,4);CHR$(208);CHR$(209);CHR$(210);CHR$(211);CHR$(212);CHR$(213);" ";
  570 PRINT TAB(1,5);CHR$(214);CHR$(215);CHR$(216);CHR$(209);CHR$(217);CHR$(218);" ";
  580 PRINT TAB(1,6);CHR$(219);CHR$(220);CHR$(221);CHR$(222);CHR$(223);CHR$(224);" ";
  590 PRINT TAB(1,7);CHR$(225);CHR$(226);CHR$(227);CHR$(228);CHR$(229);CHR$(230);" ";
  600 PRINT TAB(1,8);CHR$(231);CHR$(232);CHR$(233);CHR$(234);CHR$(235);CHR$(236);" ";
  610 ENDPROC : REM END PROC_DRAW_LOGO.
  620 :
  630 DEF PROC_INFO_TEXT : REM **** INFORMATION_TEXT ****
  640 REM DISPLAY INFORMATION SCREEN TEXT AND INFO LINE BY LINE.
  650 PRINT TAB(8,1);"AGON LIGHT2 with eZ80 CPU"
  660 PROC_PRINT_CHAR_ARRAY(8,3,1)
  670 PROC_PRINT_CHAR_ARRAY(8,4,2)
  680 PRINT TAB(8,5);"SCREEN MODE: ";M%;" (";W%;"x";H%;")"
  690 PRINT TAB(8,6);"COLOURS: ";C%
  700 PRINT TAB(8,7);"";
  710 *VERSION
  720 PRINT TAB(8,8);"BASIC Bytes Free: ";F%
  730 :
  740 ENDPROC : REM END PROC_INFO_TEXT.
  750 :
  790 DEF PROC_DRAW_COLOUR_PALETTE : REM **** COLOUR_PALATTE ****
  800 REM DISPLAY THE CURRENT COLOUR PALLETTE.
  810 VDU 23,238,255,255,255,255,255,255,255,255
  820 :
  830 VDU 31,0,10
  840 FOR PC% = 0 TO C% -1
  850 COLOUR PC%
  860 IF PC% <= 31 THEN PRINT ;CHR$(238);
  870 NEXT PC%
  880 :
  890 IF C% >= 32 THEN VDU 10 : VDU 13
  900 FOR PC% = 31 TO C% -1
  910 COLOUR PC%
  920 IF PC% > 31 THEN PRINT ;CHR$(238);
  930 NEXT PC%
  940 ENDPROC : REM END PROC_DRAW_COLOUR_PALETTE.
  950 :
  960 DEF PROC_READYUP : REM **** READYUP ****
  970 COLOUR BG%: COLOUR FG%
  980 REM MOVE CURSOR DOWN AND LEFT.
  990 VDU 10 : VDU 13 : VDU 10
 1000 :
 1010 REM SET READY PROMPT.
 1020 PRINT "AGON READY."
 1030 IF BorM$ = "M" OR BorM$ = "m" THEN *BYE
 1040 :
 1050 ENDPROC : REM END PROC_READYUP.
 1060 :
 1070 DEF PROC_LOAD_LOGO : REM **** LOAD LOGO ****
 1100 REM AGON LIGHT "Sitting Kung Fu man" LOAD LOGO CHARS.
 1110 :
 1120 VDU 23,200,7,15,31,31,31,31,31,63
 1130 VDU 23,201,192,224,240,240,240,240,240,248
 1140 VDU 23,202,63,63,31,15,15,15,7,7
 1150 VDU 23,203,248,248,240,224,224,224,192,192
 1160 VDU 23,204,0,1,7,15,31,63,127,127
 1170 VDU 23,205,7,199,199,195,227,225,240,240
 1180 VDU 23,206,192,195,195,135,135,15,15,31
 1190 VDU 23,207,0,0,224,240,248,252,252,254
 1200 VDU 23,208,0,0,1,1,3,3,7,7
 1210 VDU 23,209,255,255,255,255,255,255,255,255
 1220 VDU 23,210,248,248,248,240,224,225,193,195
 1230 VDU 23,211,63,63,127,255,255,255,255,255
 1240 VDU 23,212,255,255,255,255,255,255,223,223
 1250 VDU 23,213,0,0,128,128,128,192,192,192
 1260 VDU 23,214,7,7,15,15,15,15,15,31
 1270 VDU 23,215,255,247,231,231,231,199,135,130
 1280 VDU 23,216,199,135,135,143,15,15,31,31
 1290 VDU 23,217,207,207,207,199,199,195,129,1
 1300 VDU 23,218,224,224,224,240,240,240,240,240
 1310 VDU 23,219,31,31,31,31,15,15,15,31
 1320 VDU 23,220,128,128,128,128,129,143,135,143
 1330 VDU 23,221,31,63,15,0,128,224,224,195
 1340 VDU 23,222,252,240,128,0,3,7,35,243
 1350 VDU 23,223,1,1,1,129,193,225,241,241
 1360 VDU 23,224,240,240,240,240,240,240,240,240
 1370 VDU 23,225,31,31,3,3,3,3,7,15
 1380 VDU 23,226,223,255,255,255,255,255,254,254
 1390 VDU 23,227,199,135,135,7,15,15,31,31
 1400 VDU 23,228,241,241,241,248,248,248,248,248
 1410 VDU 23,229,253,255,255,255,255,255,255,127
 1420 VDU 23,230,240,248,248,224,224,224,240,248
 1430 VDU 23,231,31,63,63,63,31,31,15,0
 1440 VDU 23,232,254,252,252,252,248,248,224,0
 1450 VDU 23,233,31,60,32,0,0,0,0,0
 1460 VDU 23,234,120,28,12,12,0,0,0,0
 1470 VDU 23,235,127,127,127,127,127,63,15,0
 1480 VDU 23,236,248,252,252,252,252,248,240,0
 1490 VDU 23,237,255,254,252,248,240,224,192,128
 1500 ENDPROC : REM END PROC_LOAD_LOGO
 2000 :
 2010 DEF PROC_INITIALIZE : REM **** INITIALIZE ****
 2020 BG% = 4 + 128
 2030 FG% = 15
 2040 MODE M%
 2050 *FX 19 : REM VSYNC DELAYS TO MAKE SURE WE HAVE SCREEN MODE LOADED.
 2060 *FX 19
 2070 *FX 19
 2080 COLOUR BG%: COLOUR FG%: CLS
 2090 W% = FN_GETBYTE_VDP(&13)
 2100 H% = FN_GETBYTE_VDP(&14)
 2110 C% = FN_GETBYTE_VDP(&15)
 2120 F% = HIMEM-LOMEM
 2130 :
 2140 ENDPROC: REM END PROC_INITIALIZE.
 2150 :
 2590 REM READ CHARS FROM SCREEN.
 2600 DEF PROC_READ_CHARS(X%,Y%,Z%)
 2610 FOR CC% = 0 TO 30
 2620 VDU 23,0,&83,X%+CC%;Y%;
 2630 *FX 19
 2640 CH% = FN_GETWORD_VDP(&09)
 2650 IF Z% = 1 THEN VDP_ARRAY(CC%) = CH%
 2660 IF Z% = 2 THEN MOS_ARRAY(CC%) = CH%
 2670 NEXT CC%
 2680 ENDPROC: REM END PROC_READ_CHARS.
 2690 :
 3000 DEF PROC_PRINT_CHAR_ARRAY(X1%,Y1%,Z1%)
 3010 VDU 31,X1%,Y1%
 3020 FOR I% = 0 TO 30
 3030 IF Z1% = 1 THEN PRINT CHR$(VDP_ARRAY(I%));
 3040 IF Z1% = 2 THEN PRINT CHR$(MOS_ARRAY(I%));
 3050 NEXT I%
 3060 ENDPROC: REM END PROC_PRINT_CHAR_ARRAY.
 3070 :
 3500 REM GET SYSTEM VARS.
 3510 DEF FN_GETBYTE_VDP(V%)
 3520 A% = &A0
 3530 L%=V%
 3540 = USR(&FFF4)
 3550 :
 3560 DEF FN_GETWORD_VDP(V%)
 3570 = FN_GETBYTE_VDP(V%) +256 *FN_GETBYTE_VDP(V% +1)
 3580 :

