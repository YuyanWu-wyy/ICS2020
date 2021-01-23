.ORIG X3000
AND R2,R2,#0
AND R3,R3,#0
AND R4,R4,#0
AND R5,R5,#0;COUNTER1
AND R6,R6,#0;COUNTER2
ADD R2,R0,#0
        
JUDGE1:        ADD R0,R0,#0        
        BRp JUDGERs
         BRz ZERO
         BRn REVER0
JUDGERs ADD R1,R1,#0
         BRp GCD
         BRz ZERO
         BRn REVER1
ZERO AND R0,R0,#0
     HALT
REVER0:NOT R0,R0 
        ADD R0,R0,#1
        ADD R2,R0,#0
        BRnzp JUDGERs
REVER1:NOT R1,R1
       ADD R1,R1,#1       

GCD ADD R5,R5,#1
    ADD R0,R2,#0
    NOT R3,R1
    ADD R3,R3,#1
    ADD R2,R0,R3
    
    BRz FINAL
    BRp GCD
    ADD R6,R6,#1
    ADD R2,R0,#0
    ;swap R0,R1
    ADD R4,R0,#0
    ADD R0,R1,#0
    ADD R1,R4,#0
    ADD R2,R0,#0
    BRnzp GCD
    

FINAL ADD R0,R2,#0
ADD R0,R1,#0
HALT
.END