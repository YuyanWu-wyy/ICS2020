	.text
	.globl	a1
	.section	.sdata,"aw"
	.align 2
	.size	a1, 4
a1:
	.word	3
	.globl	a2
	.align	2
	.type	a2, @object
	.size	a2, 4
a2:
	.word	5
	.globl	a3
	.align	2
	.type	a3, @object
	.size	a3, 4
a3:
	.word	8
	.comm	a5,4,4
	.section	.rodata
	.align	2
.LC0:
	.string	"Row A:"
	.align	2
.LC1:
	.string	"Row B:"
	.align	2
.LC2:
	.string	"Row C:"
	.align	2
.LC3:
	.string	"Player 1, choose a row and number of rocks:"
	.align	2
.LC4:
	.string	"Player 2, choose a row and number of rocks:"
	.align	2
.LC5:
	.string	"%c%d"
	.align	2
.LC6:
	.string	"Invalid move. Try again."
	.align	2
.LC7:
	.string	"Player 1 Wins."
	.align	2
.LC8:
	.string	"Player 2 Wins."
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	zero,-20(s0)
.L22:
	lui	a5,%hi(a1)
	lw	a5,%lo(a1)(a5)
	bne	a5,zero,.L2
	lui	a5,%hi(a2)
	lw	a5,%lo(a2)(a5)
	bne	a5,zero,.L2
	lui	a5,%hi(a3)
	lw	a5,%lo(a3)(a5)
	beq	a5,zero,.L27
.L2:
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	sw	zero,-24(s0)
	j	.L4
.L5:
	li	a0,111
	call	putchar
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L4:
	lui	a5,%hi(a1)
	lw	a5,%lo(a1)(a5)
	lw	a4,-24(s0)
	blt	a4,a5,.L5
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	sw	zero,-28(s0)
	j	.L6
.L7:
	li	a0,111
	call	putchar
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L6:
	lui	a5,%hi(a2)
	lw	a5,%lo(a2)(a5)
	lw	a4,-28(s0)
	blt	a4,a5,.L7
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	sw	zero,-32(s0)
	j	.L8
.L9:
	li	a0,111
	call	putchar
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L8:
	lui	a5,%hi(a3)
	lw	a5,%lo(a3)(a5)
	lw	a4,-32(s0)
	blt	a4,a5,.L9
	li	a0,10
	call	putchar
.L10:
	lw	a5,-20(s0)
	bne	a5,zero,.L11
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
.L11:
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L12
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
.L12:
	addi	a4,s0,-33
	lui	a5,%hi(a5)
	addi	a2,a5,%lo(a5)
	mv	a1,a4
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	scanf
	call	getchar
	li	a0,10
	call	putchar
	lbu	a4,-33(s0)
	li	a5,65
	beq	a4,a5,.L13
	lbu	a4,-33(s0)
	li	a5,66
	beq	a4,a5,.L13
	lbu	a4,-33(s0)
	li	a5,67
	beq	a4,a5,.L13
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	j	.L10
.L13:
	lbu	a4,-33(s0)
	li	a5,65
	bne	a4,a5,.L14
	lui	a5,%hi(a5)
	lw	a4,%lo(a5)(a5)
	lui	a5,%hi(a1)
	lw	a5,%lo(a1)(a5)
	ble	a4,a5,.L15
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	j	.L10
.L15:
	lui	a5,%hi(a1)
	lw	a4,%lo(a1)(a5)
	lui	a5,%hi(a5)
	lw	a5,%lo(a5)(a5)
	sub	a4,a4,a5
	lui	a5,%hi(a1)
	sw	a4,%lo(a1)(a5)
.L14:
	lbu	a4,-33(s0)
	li	a5,66
	bne	a4,a5,.L16
	lui	a5,%hi(a5)
	lw	a4,%lo(a5)(a5)
	lui	a5,%hi(a2)
	lw	a5,%lo(a2)(a5)
	ble	a4,a5,.L17
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	j	.L10
.L17:
	lui	a5,%hi(a2)
	lw	a4,%lo(a2)(a5)
	lui	a5,%hi(a5)
	lw	a5,%lo(a5)(a5)
	sub	a4,a4,a5
	lui	a5,%hi(a2)
	sw	a4,%lo(a2)(a5)
.L16:
	lbu	a4,-33(s0)
	li	a5,67
	bne	a4,a5,.L18
	lui	a5,%hi(a5)
	lw	a4,%lo(a5)(a5)
	lui	a5,%hi(a3)
	lw	a5,%lo(a3)(a5)
	ble	a4,a5,.L19
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	j	.L10
.L19:
	lui	a5,%hi(a3)
	lw	a4,%lo(a3)(a5)
	lui	a5,%hi(a5)
	lw	a5,%lo(a5)(a5)
	sub	a4,a4,a5
	lui	a5,%hi(a3)
	sw	a4,%lo(a3)(a5)
.L18:
	lw	a5,-20(s0)
	bne	a5,zero,.L20
	li	a5,1
	sw	a5,-20(s0)
	j	.L22
.L20:
	sw	zero,-20(s0)
	j	.L22
.L27:
	nop
	lw	a5,-20(s0)
	bne	a5,zero,.L23
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	j	.L24
.L23:
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
.L24:
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
