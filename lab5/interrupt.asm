; Unfortunately we have not YET installed Windows or Linux on the LC-3,
; so we are going to have to write some operating system code to enable
; keyboard interrupts. The OS code does three things:
;
;    (1) Initializes the interrupt vector table with the starting
;        address of the interrupt service routine. The keyboard
;        interrupt vector is x80 and the interrupt vector table begins
;        at memory location x0100. The keyboard interrupt service routine
;        begins at x1000. Therefore, we must initialize memory location
;        x0180 with the value x1000.
;    (2) Sets bit 14 of the KBSR to enable interrupts.
;    (3) Pushes a PSR and PC to the system stack so that it can jump
;        to the user program at x3000 using an RTI instruction.

        .ORIG x800
        ; (1) Initialize interrupt vector table.
        LD R0, VEC
        LD R1, ISR
        STR R1, R0, #0

        ; (2) Set bit 14 of KBSR.
        LDI R0, KBSR
        LD R1, MASK
        NOT R1, R1
        AND R0, R0, R1
        NOT R1, R1
        ADD R0, R0, R1
        STI R0, KBSR

        ; (3) Set up system stack to enter user space.
        LD R0, PSR
        ADD R6, R6, #-1
        STR R0, R6, #0
        LD R0, PC
        ADD R6, R6, #-1
        STR R0, R6, #0
        ; Enter user space.
        RTI
        
VEC     .FILL x0180
ISR     .FILL x1000
KBSR    .FILL xFE00
MASK    .FILL x4000
PSR     .FILL x8002
PC      .FILL x3000
        .END

        .ORIG x3000
        ; *** Begin user program code here ***
        LOOP:
LEA R0,ICS
PUTS
LEA R0,SPACE
PUTS
BRnzp DELAY
NEXT:
BRnzp LOOP
HALT
DELAY ST R1, SaveR1
LD R1, COUNT
REP ADD R1, R1, #-1
BRp REP
LD R1, SaveR1
BRnzp NEXT
HALT
COUNT .FILL x7FFF
SaveR1 .BLKW #1
ICS .STRINGZ "ICS2020"
SPACE .STRINGZ " "
.END
.ORIG x1000
AND R0,R0,#0
GETC
AND R1,R1,#0
ADD R1,R0,#0
AND R2,R2,#0
AND R3,R3,#0
LD R3,ZERO
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,ONE
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,TWO
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,THREE
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,FOUR
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,SIX
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,SEVEN
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,EIGHT
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
LD R3,NINE
NOT R3,R3
ADD R3,R3,#1
ADD R3,R3,R1
BRz YES
BRnzp NO
YES:
ADD R0,R1,#0
OUT
LEA R0,YESNOTE
PUTS
RTI

NO:
ADD R0,R1,#0
OUT
LEA R0,NONOTE
PUTS
RTI
HALT
ZERO .STRINGZ "0"
ONE .STRINGZ "1"
TWO .STRINGZ "2"
THREE .STRINGZ "3"
FOUR .STRINGZ "4"
FIVE .STRINGZ "5"
SIX .STRINGZ "6"
SEVEN .STRINGZ "7"
EIGHT .STRINGZ "8"
NINE .STRINGZ "9"
YESNOTE .STRINGZ " is a decimal digit"
NONOTE .STRINGZ " is not a decimal digit."
        ; *** End user program code here ***
        .END

