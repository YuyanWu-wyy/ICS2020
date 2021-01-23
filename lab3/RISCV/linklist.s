.equ CONSTANT1,0x00000056
.equ CONSTANT2,0xffff0
.equ CONSTANT3 0x00000234
.equ CONSTANT4 0x00000073
.equ LOCA1,0x3100
.equ LOCA2,0x3500
.equ LOCA3,0x3200
.equ LOCA4,0x3126
.equ LOCA5,0x3108
.equ LOCAFINAL,0x5000
lui a0,LOCA1
lui a1,LOCA2
sw a1,0(a0)
lui   a0,LOCA2
lui a1,LOCA3
sw a1,0(a0)
lui   a0,LOCA3
lui a1,LOCA4
sw a1,0(a0)
lui   a0,LOCA4
lui a1,LOCA5
sw a1,0(a0)
lui   a0,LOCA5
lui a1,LOCAFINAL
sw a1,0(a0)

lui   a0,LOCA2
addi a0,a0,4
lui a1,CONSTANT1
sw a1,0(a0)
lui   a0,LOCA3
addi a0,a0,4
lui a1,CONSTANT2
sw a1,0(a0)
lui   a0,LOCA4
addi a0,a0,4
lui a1,CONSTANT3
sw a1,0(a0)
lui   a0,LOCA5
addi a0,a0,4
lui a1,CONSTANT4
sw a1,0(a0)


lui   a0,LOCA1
lw t0,0(a0)
lui   a0,LOCA2
lw t1,0(a0)
lui   a0,LOCA3
lw t2,0(a0)

andi a0,a0,0
andi a1,a1,0
andi a2,a2,0
andi a3,a3,0
andi a4,a4,0
andi a5,a5,0
andi a6,a6,0
andi a7,a7,0
lui  a0, LOCA1 #a0储存起始点
lui  a1,LOCAFINAL #a1储存LOCA2的值

lw a0,0(a0)


JUDGE1: andi a5,a5,0
lw a5,0(a0)     
not a2,a5
addi a2,a2,1
add a2,a2,a1
beqz a2,THEEND1

BUBBLE: addi a6,a0,4
lw a3,0(a6)
bltz a3,NEGA3
NEGABACK1:
lw a6,0(a0)
addi a6,a6,4
lw a4,0(a6)
bltz a4,SWAP
NEGABACK2:
not a5,a3
addi a5,a5,1
add a5,a5,a4
bltz a5,SWAP
jal NEXT

NEGA3:
lw a6,0(a0)
addi a6,a6,4
lw a4,0(a6)
bltz a4,NEGA4
jal NEXT

NEGA4:
not a4,a4
addi a4,a4,1
not a3,a3
addi a3,a3,1
not a5,a3
addi a5,a5,1
add a5,a5,a4
bgtz a5,SWAPNEGA
jal NEXT

SWAPNEGA:
not a4,a4
addi a4,a4,1
not a3,a3
addi a3,a3,1
jal SWAP


SWAP: 
addi a7,a0,4
sw a4,0(a7)
lw a7,0(a0)
addi a7,a7,4
sw a3,0(a7)
jal NEXT

NEXT:
lw a0,0(a0)
jal JUDGE1

THEEND1: addi a1,a0,0
lui  a0, LOCA1
lw a0,0(a0)
jal JUDGE2

JUDGE2: andi a5,a5,0
andi a2,a2,0
lui      a5, LOCA1
lw a5,0(a5)
not a2,a1
addi a2,a2,1
add a2,a5,a2
beqz a2,THEEND2
jal JUDGE1
#查看结果
THEEND2: 
lui   s0,LOCA2
addi s0,s0,4
lw s1,0(s0)
lui   s2,LOCA3
addi s2,s2,4
lw s2,0(s2)
lui   s3,LOCA4
addi s3,s3,4
lw s3,0(s3)
lui   s4,LOCA5
addi s4,s4,4
lw s4,0(s4)
andi ra,ra,0
addi ra,ra,-100
ret
