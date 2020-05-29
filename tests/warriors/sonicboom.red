;redcode-94
;name Sonic Boom 1.30
;author Eric J. Schwertfeger
;strategy Two SPL bombing carpet bombers going opposite
;strategy Directions, with a monitor that relaunches carpet
;strategy bombers whenever both die.
;strategy v 1.3X Going back to original bombing pattern, hence return
;strategy        to 1.XX numbers.
;assert 1

WAIT	EQU	(568)
FSTEP	EQU	(16*12)
RSTEP	EQU	(-16*12)
RCSRC	DAT	#0,#RBDST+(RSTEP)+1
RSTART	MOV	RCSRC,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RBDST-RSTEP,<(RBDST-RSTEP)
	MOV	RCSRC,<(RBDST-RSTEP)	; this pass
	MOV	RCSRC,<(RBDST-RSTEP)
	MOV	RCSRC,<(RBDST-RSTEP)
	MOV	RCSRC,<(RBDST-RSTEP)
RMOVE	MOV	<(RCSRC-RSTEP),<(RCDST-RSTEP)
RCDST	JMP	RSTART+RSTEP,RBDST+(RSTEP*2)+1
RBDST	SPL	0,#RSTART-240
SHOOT	SPL	FLAUNCH
	SPL	RLAUNCH
	MOV	#(WAIT/3),DELAY
WATCH	JMN	DIE,RSTART-150
	JMN	DIE,FBDST+150
DELAY	DJN	WATCH,#DELAY
	JMP	SHOOT
FLAUNCH MOV     #FCDST+2+FSTEP-FCSRC,FCSRC-FSTEP
        MOV     #2+(FSTEP*2),FCDST-FSTEP
        MOV     #FCDST+2+FSTEP-FCSRC,FCSRC
        MOV     #2+(FSTEP*2),FCDST
	MOV	#241,FBDST
	SPL	1
	SPL	1
	SPL	1
	SPL	1
	JMP	FMOVE
DIE	DAT	#0,#0
LAUNCH  SPL     DLAUNCH
        DJN     0,#(32*2+4)
        MOV     DIE,DSTART+(32*DSKIP)
        JMP     SHOOT
DSKIP   EQU     (247)
DLAUNCH MOV     DSRC,DSRC-DSKIP
        MOV     DDEST,DDEST-DSKIP
        SPL     1
        MOV     -1,0
        JMP     DSTART
DSRC    DAT     #DDEST+1+DSKIP
DSTART  MOV     <DSRC-DSKIP,<DDEST-DSKIP
DDEST   JMP     DSTART+DSKIP,#1+(DSKIP*2)
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
	DAT	#0,#0
RLAUNCH MOV     #RCDST+2+RSTEP-RCSRC,RCSRC-RSTEP
        MOV     #2+(RSTEP*2),RCDST-RSTEP
        MOV     #RCDST+2+RSTEP-RCSRC,RCSRC
        MOV     #2+(RSTEP*2),RCDST
	MOV	#-254,RBDST
	SPL	1
	SPL	1
	SPL	1
	SPL	1
	JMP	RMOVE
FCSRC	DAT	#0,#FBDST+(FSTEP)+1
FSTART	MOV	FCSRC,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FBDST-FSTEP,>(FBDST-FSTEP)
	MOV	FCSRC,>(FBDST-FSTEP)
	MOV	FCSRC,>(FBDST-FSTEP)
	MOV	FCSRC,>(FBDST-FSTEP)
	MOV	FCSRC,>(FBDST-FSTEP)
FMOVE	MOV	<(FCSRC-FSTEP),<(FCDST-FSTEP)
FCDST	JMP	FSTART+FSTEP,FBDST+(FSTEP*2)+1
FBDST	SPL	0,#241
	END	LAUNCH
