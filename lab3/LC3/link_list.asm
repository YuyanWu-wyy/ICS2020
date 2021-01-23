.ORIG X3000
AND R0,R0,#0
AND R1,R1,#0
AND R2,R2,#0
AND R3,R3,#0;表示前一个的value
AND R4,R4,#0;表示后一个的value
AND R5,R5,#0
AND R6,R6,#0
AND R7,R7,#0
LD R0,START
LD R1,FINAL
LDR R0,R0,#0
;判断头结点是不是等于尾结点，否则调到BUBBLE
JUDGE1: 
       AND R5,R5,#0
       LDR R5,R0,#0
       NOT R2,R5
       ADD R2,R2,#1
       ADD R2,R2,R1
       BRz THEEND1
        
BUBBLE: ADD R6,R0,#1
        LDR R3,R6,#0
        BRn NEGA3
NEGABACK1:
        LDR R6,R0,#0
        LDR R4,R6,#1
        BRn SWAP
NEGABACK2:
        NOT R5,R3
        ADD R5,R5,#1
        ADD R5,R5,R4
        BRn SWAP
        BRnzp NEXT
        
NEGA3:
        LDR R6,R0,#0
        LDR R4,R6,#1
        BRn NEGA4
        BRnzp NEXT
NEGA4:
        NOT R4,R4
        ADD R4,R4,#1
        NOT R3,R3
        ADD R3,R3,#1
        NOT R5,R3
        ADD R5,R5,#1
        ADD R5,R5,R4
        BRp SWAPNEGA
        BRnzp NEXT
        
SWAPNEGA:
        NOT R4,R4
        ADD R4,R4,#1
        NOT R3,R3
        ADD R3,R3,#1
        BRnzp SWAP
SWAP: STR R4,R0,#1
      LDR R7,R0,#0
      STR R3,R7,#1
      BRnzp NEXT
       
NEXT: LDR R0,R0,#0
      BRnzp JUDGE1
;内层循环结束，重新配置R1的值，将R0的值赋值给R1
THEEND1: ADD R1,R0,#0
         LD R0,START
         LDR R0,R0,#0
         BRnzp JUDGE2
JUDGE2:  AND R5,R5,#0
         AND R2,R2,#0
         LD R5,START
         LDR R5,R5,#0
         NOT R2,R1
         ADD R2,R2,#1
         ADD R2,R5,R2
         BRz THEEND2
         BRnzp JUDGE1
THEEND2: HALT

START .FILL x3100
FINAL .FILL x0000

.END