	.file	"selection.c"
	.option nopic
	.attribute arch, "rv32i2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	selection_sort
	.type	selection_sort, @function
selection_sort:
	li	a5,1
	ble	a0,a5,.L1
	mv	t1,a1
	addi	t3,a0,-1
	li	a7,0
	j	.L6
.L4:
	addi	a4,a4,1
	addi	a3,a3,4
	beq	a0,a4,.L3
.L5:
	slli	a5,a2,2
	add	a5,a1,a5
	lw	a6,4(a3)
	lw	a5,0(a5)
	bge	a6,a5,.L4
	mv	a2,a4
	j	.L4
.L3:
	lw	a5,0(t1)
	slli	a2,a2,2
	add	a2,a1,a2
	lw	a4,0(a2)
	sw	a4,0(t1)
	sw	a5,0(a2)
	addi	t1,t1,4
	beq	a7,t3,.L1
.L6:
	mv	a2,a7
	addi	a7,a7,1
	ble	a0,a7,.L3
	mv	a3,t1
	mv	a4,a7
	j	.L5
.L1:
	ret
	.size	selection_sort, .-selection_sort
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
