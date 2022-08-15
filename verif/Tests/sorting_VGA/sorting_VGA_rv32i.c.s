	.file	"sorting_VGA.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	delay
	.type	delay, @function
delay:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,81920
	addi	a5,a5,-1921
	ble	a4,a5,.L3
	nop
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	delay, .-delay
	.align	2
	.globl	draw_stick
	.type	draw_stick, @function
draw_stick:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	lw	a5,-56(s0)
	addi	a5,a5,321
	slli	a5,a5,1
	lw	a4,-60(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	li	a5,4096
	addi	a5,a5,-496
	sw	a5,-32(s0)
	lw	a4,-52(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,4
	addi	a5,a5,1
	sw	a5,-36(s0)
	sw	zero,-20(s0)
	j	.L5
.L6:
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	sub	a4,a4,a5
	lw	a5,-32(s0)
	add	a5,a4,a5
	slli	a4,a5,2
	li	a5,54525952
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,80
	sw	a5,-20(s0)
.L5:
	lw	a4,-20(s0)
	li	a5,4096
	addi	a5,a5,-1696
	ble	a4,a5,.L6
	sw	zero,-24(s0)
	j	.L7
.L8:
	lw	a4,-28(s0)
	lw	a5,-24(s0)
	sub	a4,a4,a5
	lw	a5,-32(s0)
	add	a5,a4,a5
	slli	a4,a5,2
	li	a5,54525952
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,80
	sw	a5,-24(s0)
.L7:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L8
	nop
	nop
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	draw_stick, .-draw_stick
	.align	2
	.globl	swap
	.type	swap, @function
swap:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	lw	a5,-40(s0)
	lbu	a4,0(a5)
	lw	a5,-36(s0)
	sb	a4,0(a5)
	lw	a5,-40(s0)
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	swap, .-swap
	.align	2
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L11
.L15:
	sw	zero,-24(s0)
	j	.L12
.L14:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a3,-36(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bleu	a4,a5,.L13
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a3,a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	call	swap
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	li	a2,40
	lw	a1,-24(s0)
	mv	a0,a5
	call	draw_stick
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,1
	li	a2,40
	mv	a1,a5
	mv	a0,a4
	call	draw_stick
	call	delay
.L13:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L12:
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-24(s0)
	blt	a4,a5,.L14
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L11:
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	blt	a4,a5,.L15
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	bubbleSort, .-bubbleSort
	.align	2
	.globl	partition
	.type	partition, @function
partition:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	mv	a5,a1
	mv	a4,a2
	sb	a5,-37(s0)
	mv	a5,a4
	sb	a5,-38(s0)
	lbu	a5,-38(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-25(s0)
	lbu	a5,-37(s0)
	addi	a5,a5,-1
	sb	a5,-17(s0)
	lbu	a5,-37(s0)
	sw	a5,-24(s0)
	j	.L17
.L19:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	lbu	a4,-25(s0)
	bltu	a4,a5,.L18
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	lw	a4,-36(s0)
	add	a3,a4,a5
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	call	swap
	lbu	a5,-17(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lbu	a5,-17(s0)
	li	a2,0
	mv	a1,a5
	mv	a0,a4
	call	draw_stick
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	li	a2,0
	lw	a1,-24(s0)
	mv	a0,a5
	call	draw_stick
	lbu	a5,-17(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-24(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	beq	a4,a5,.L18
	call	delay
.L18:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L17:
	lbu	a5,-38(s0)
	lw	a4,-24(s0)
	blt	a4,a5,.L19
	lbu	a5,-17(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a3,a4,a5
	lbu	a5,-38(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	call	swap
	lbu	a5,-17(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lbu	a5,-17(s0)
	addi	a5,a5,1
	li	a2,0
	mv	a1,a5
	mv	a0,a4
	call	draw_stick
	lbu	a5,-38(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lbu	a5,-38(s0)
	li	a2,0
	mv	a1,a5
	mv	a0,a4
	call	draw_stick
	lbu	a5,-17(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lbu	a5,-38(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	beq	a4,a5,.L20
	call	delay
.L20:
	lbu	a5,-17(s0)
	addi	a5,a5,1
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	partition, .-partition
	.align	2
	.globl	quickSortIterative
	.type	quickSortIterative, @function
quickSortIterative:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	mv	a3,a1
	sb	a3,-37(s0)
	mv	a3,a2
	sb	a3,-38(s0)
	mv	a3,sp
	mv	s1,a3
	lbu	a2,-38(s0)
	lbu	a3,-37(s0)
	sub	a3,a2,a3
	addi	a3,a3,1
	addi	a2,a3,-1
	sw	a2,-24(s0)
	mv	a2,a3
	mv	t3,a2
	li	t4,0
	srli	a2,t3,29
	slli	a7,t4,3
	or	a7,a2,a7
	slli	a6,t3,3
	mv	a2,a3
	mv	t1,a2
	li	t2,0
	srli	a2,t1,29
	slli	a5,t2,3
	or	a5,a2,a5
	slli	a4,t1,3
	mv	a5,a3
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,0
	sw	a5,-28(s0)
	li	a5,-1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,-37(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,-38(s0)
	sb	a4,0(a5)
	j	.L23
.L25:
	lw	a5,-20(s0)
	addi	a4,a5,-1
	sw	a4,-20(s0)
	lw	a4,-28(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-38(s0)
	lw	a5,-20(s0)
	addi	a4,a5,-1
	sw	a4,-20(s0)
	lw	a4,-28(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-37(s0)
	lbu	a4,-38(s0)
	lbu	a5,-37(s0)
	mv	a2,a4
	mv	a1,a5
	lw	a0,-36(s0)
	call	partition
	mv	a5,a0
	sb	a5,-29(s0)
	lbu	a5,-29(s0)
	addi	a4,a5,-1
	lbu	a5,-37(s0)
	ble	a4,a5,.L24
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,-37(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lbu	a5,-29(s0)
	addi	a5,a5,-1
	andi	a4,a5,0xff
	lw	a3,-28(s0)
	lw	a5,-20(s0)
	add	a5,a3,a5
	sb	a4,0(a5)
.L24:
	lbu	a5,-29(s0)
	addi	a4,a5,1
	lbu	a5,-38(s0)
	bge	a4,a5,.L23
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lbu	a5,-29(s0)
	addi	a5,a5,1
	andi	a4,a5,0xff
	lw	a3,-28(s0)
	lw	a5,-20(s0)
	add	a5,a3,a5
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,-38(s0)
	sb	a4,0(a5)
.L23:
	lw	a5,-20(s0)
	bge	a5,zero,.L25
	mv	sp,s1
	nop
	addi	sp,s0,-48
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	quickSortIterative, .-quickSortIterative
	.align	2
	.globl	min
	.type	min, @function
min:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	ble	a5,a4,.L28
	mv	a5,a4
.L28:
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	min, .-min
	.align	2
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L30
.L33:
	sw	zero,-24(s0)
	j	.L31
.L32:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	addi	a4,a5,-1
	lw	a5,-40(s0)
	addi	a5,a5,-1
	mv	a1,a5
	mv	a0,a4
	call	min
	sw	a0,-28(s0)
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-24(s0)
	add	a5,a4,a5
	addi	a4,a5,-1
	lw	a5,-40(s0)
	addi	a5,a5,-1
	mv	a1,a5
	mv	a0,a4
	call	min
	sw	a0,-32(s0)
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	lw	a4,-28(s0)
	andi	a4,a4,0xff
	lw	a3,-32(s0)
	andi	a3,a3,0xff
	mv	a2,a4
	mv	a1,a5
	lw	a0,-36(s0)
	call	merge
	lw	a5,-20(s0)
	slli	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
.L31:
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-24(s0)
	blt	a4,a5,.L32
	lw	a5,-20(s0)
	slli	a5,a5,1
	sw	a5,-20(s0)
.L30:
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	bgt	a4,a5,.L33
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	mergeSort, .-mergeSort
	.align	2
	.globl	merge
	.type	merge, @function
merge:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	addi	s0,sp,96
	sw	a0,-84(s0)
	mv	a0,a1
	mv	a1,a2
	mv	a2,a3
	mv	a3,a0
	sb	a3,-85(s0)
	mv	a3,a1
	sb	a3,-86(s0)
	mv	a3,a2
	sb	a3,-87(s0)
	mv	a3,sp
	mv	s1,a3
	lbu	a2,-86(s0)
	lbu	a3,-85(s0)
	sub	a3,a2,a3
	andi	a3,a3,0xff
	addi	a3,a3,1
	sb	a3,-52(s0)
	lbu	a2,-87(s0)
	lbu	a3,-86(s0)
	sub	a3,a2,a3
	sb	a3,-53(s0)
	lbu	a3,-52(s0)
	mv	a2,a3
	addi	a2,a2,-1
	sw	a2,-60(s0)
	mv	s6,a3
	li	s7,0
	srli	a2,s6,29
	slli	t4,s7,3
	or	t4,a2,t4
	slli	t3,s6,3
	mv	s4,a3
	li	s5,0
	srli	a2,s4,29
	slli	t2,s5,3
	or	t2,a2,t2
	slli	t1,s4,3
	addi	a3,a3,15
	srli	a3,a3,4
	slli	a3,a3,4
	sub	sp,sp,a3
	mv	a3,sp
	addi	a3,a3,0
	sw	a3,-64(s0)
	lbu	a3,-53(s0)
	mv	a2,a3
	addi	a2,a2,-1
	sw	a2,-68(s0)
	mv	s2,a3
	li	s3,0
	srli	a2,s2,29
	slli	a7,s3,3
	or	a7,a2,a7
	slli	a6,s2,3
	mv	t5,a3
	li	t6,0
	srli	a2,t5,29
	slli	a5,t6,3
	or	a5,a2,a5
	slli	a4,t5,3
	mv	a5,a3
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,0
	sw	a5,-72(s0)
	sb	zero,-51(s0)
	j	.L35
.L36:
	lbu	a4,-85(s0)
	lbu	a5,-51(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-84(s0)
	add	a4,a5,a4
	lbu	a5,-51(s0)
	lbu	a4,0(a4)
	lw	a3,-64(s0)
	add	a5,a3,a5
	sb	a4,0(a5)
	lbu	a5,-51(s0)
	addi	a5,a5,1
	sb	a5,-51(s0)
.L35:
	lbu	a4,-51(s0)
	lbu	a5,-52(s0)
	bltu	a4,a5,.L36
	sb	zero,-50(s0)
	j	.L37
.L38:
	lbu	a5,-86(s0)
	addi	a4,a5,1
	lbu	a5,-50(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-84(s0)
	add	a4,a5,a4
	lbu	a5,-50(s0)
	lbu	a4,0(a4)
	lw	a3,-72(s0)
	add	a5,a3,a5
	sb	a4,0(a5)
	lbu	a5,-50(s0)
	addi	a5,a5,1
	sb	a5,-50(s0)
.L37:
	lbu	a4,-50(s0)
	lbu	a5,-53(s0)
	bltu	a4,a5,.L38
	sb	zero,-51(s0)
	sb	zero,-50(s0)
	lbu	a5,-85(s0)
	sb	a5,-49(s0)
	j	.L39
.L43:
	lbu	a5,-51(s0)
	lw	a4,-64(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lbu	a5,-50(s0)
	lw	a3,-72(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bgtu	a4,a5,.L40
	lbu	a4,-51(s0)
	lbu	a5,-49(s0)
	lw	a3,-84(s0)
	add	a5,a3,a5
	lw	a3,-64(s0)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lbu	a5,-49(s0)
	lw	a4,-84(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a3,a5
	lbu	a4,-49(s0)
	li	a5,4096
	addi	a2,a5,704
	mv	a1,a4
	mv	a0,a3
	call	draw_stick
	call	delay
	lbu	a5,-51(s0)
	addi	a5,a5,1
	sb	a5,-51(s0)
	j	.L41
.L40:
	lbu	a4,-50(s0)
	lbu	a5,-49(s0)
	lw	a3,-84(s0)
	add	a5,a3,a5
	lw	a3,-72(s0)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lbu	a5,-49(s0)
	lw	a4,-84(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a3,a5
	lbu	a4,-49(s0)
	li	a5,4096
	addi	a2,a5,704
	mv	a1,a4
	mv	a0,a3
	call	draw_stick
	call	delay
	lbu	a5,-50(s0)
	addi	a5,a5,1
	sb	a5,-50(s0)
.L41:
	lbu	a5,-49(s0)
	addi	a5,a5,1
	sb	a5,-49(s0)
.L39:
	lbu	a4,-51(s0)
	lbu	a5,-52(s0)
	bgeu	a4,a5,.L44
	lbu	a4,-50(s0)
	lbu	a5,-53(s0)
	bltu	a4,a5,.L43
	j	.L44
.L45:
	lbu	a4,-51(s0)
	lbu	a5,-49(s0)
	lw	a3,-84(s0)
	add	a5,a3,a5
	lw	a3,-64(s0)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lbu	a5,-49(s0)
	lw	a4,-84(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a3,a5
	lbu	a4,-49(s0)
	li	a5,4096
	addi	a2,a5,704
	mv	a1,a4
	mv	a0,a3
	call	draw_stick
	call	delay
	lbu	a5,-51(s0)
	addi	a5,a5,1
	sb	a5,-51(s0)
	lbu	a5,-49(s0)
	addi	a5,a5,1
	sb	a5,-49(s0)
.L44:
	lbu	a4,-51(s0)
	lbu	a5,-52(s0)
	bltu	a4,a5,.L45
	j	.L46
.L47:
	lbu	a4,-50(s0)
	lbu	a5,-49(s0)
	lw	a3,-84(s0)
	add	a5,a3,a5
	lw	a3,-72(s0)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lbu	a5,-49(s0)
	lw	a4,-84(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a3,a5
	lbu	a4,-49(s0)
	li	a5,4096
	addi	a2,a5,704
	mv	a1,a4
	mv	a0,a3
	call	draw_stick
	call	delay
	lbu	a5,-50(s0)
	addi	a5,a5,1
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	addi	a5,a5,1
	sb	a5,-49(s0)
.L46:
	lbu	a4,-50(s0)
	lbu	a5,-53(s0)
	bltu	a4,a5,.L47
	mv	sp,s1
	nop
	addi	sp,s0,-96
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	addi	sp,sp,96
	jr	ra
	.size	merge, .-merge
	.align	2
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L49
.L53:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	j	.L50
.L52:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a3,a5,1
	li	a5,4096
	addi	a2,a5,744
	mv	a1,a3
	mv	a0,a4
	call	draw_stick
	call	delay
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
.L50:
	lw	a5,-24(s0)
	blt	a5,zero,.L51
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-28(s0)
	blt	a4,a5,.L52
.L51:
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a3,a5,1
	li	a5,4096
	addi	a2,a5,744
	mv	a1,a3
	mv	a0,a4
	call	draw_stick
	call	delay
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L49:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L53
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	insertionSort, .-insertionSort
	.section	.rodata
	.align	2
.LC1:
	.ascii	"\013\005\t\r\022\007\001\002\f\n\004\003\016\006\017\021\b\020"
	.align	2
.LC0:
	.word	11
	.word	5
	.word	9
	.word	13
	.word	18
	.word	7
	.word	1
	.word	2
	.word	12
	.word	10
	.word	4
	.word	3
	.word	14
	.word	6
	.word	15
	.word	17
	.word	8
	.word	16
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-192
	sw	ra,188(sp)
	sw	s0,184(sp)
	addi	s0,sp,192
	li	a5,12582912
	lw	a5,0(a5)
	sw	a5,-40(s0)
	lw	a4,-40(s0)
	li	a5,7
	beq	a4,a5,.L55
	lw	a4,-40(s0)
	li	a5,7
	bgt	a4,a5,.L56
	lw	a4,-40(s0)
	li	a5,6
	beq	a4,a5,.L57
	lw	a4,-40(s0)
	li	a5,6
	bgt	a4,a5,.L56
	lw	a4,-40(s0)
	li	a5,4
	beq	a4,a5,.L58
	lw	a4,-40(s0)
	li	a5,5
	beq	a4,a5,.L59
	j	.L56
.L58:
	call	delay
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	sw	a1,-76(s0)
	sw	a2,-72(s0)
	sw	a3,-68(s0)
	sw	a4,-64(s0)
	lhu	a5,16(a5)
	sh	a5,-60(s0)
	li	a5,18
	sw	a5,-56(s0)
	sw	zero,-24(s0)
	j	.L60
.L61:
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-60(a5)
	li	a2,0
	lw	a1,-24(s0)
	mv	a0,a5
	call	draw_stick
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L60:
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L61
	call	delay
	lw	a5,-56(s0)
	andi	a5,a5,0xff
	addi	a5,a5,-1
	andi	a4,a5,0xff
	addi	a5,s0,-76
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	quickSortIterative
	call	delay
	j	.L58
.L59:
	call	delay
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-188
	mv	a3,a4
	li	a4,72
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	li	a5,18
	sw	a5,-52(s0)
	sw	zero,-28(s0)
	j	.L62
.L63:
	lw	a5,-28(s0)
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a4,-172(a5)
	li	a5,4096
	addi	a2,a5,744
	lw	a1,-28(s0)
	mv	a0,a4
	call	draw_stick
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L62:
	lw	a4,-28(s0)
	lw	a5,-52(s0)
	blt	a4,a5,.L63
	call	delay
	addi	a5,s0,-188
	lw	a1,-52(s0)
	mv	a0,a5
	call	insertionSort
	call	delay
	j	.L59
.L57:
	sw	zero,-20(s0)
	j	.L64
.L65:
	lw	a5,-20(s0)
	slli	a4,a5,2
	li	a5,54525952
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a4,-20(s0)
	li	a5,4096
	addi	a5,a5,704
	add	a5,a4,a5
	slli	a4,a5,2
	li	a5,54525952
	addi	a5,a5,-320
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a4,a5,2
	li	a5,54562816
	addi	a5,a5,1216
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L64:
	lw	a4,-20(s0)
	li	a5,79
	ble	a4,a5,.L65
	sw	zero,-20(s0)
	j	.L66
.L67:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	li	a5,54525952
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	li	a5,54525952
	addi	a5,a5,156
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	li	a5,54525952
	addi	a5,a5,316
	add	a5,a4,a5
	li	a4,-1
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L66:
	lw	a4,-20(s0)
	li	a5,119
	ble	a4,a5,.L67
.L70:
	call	delay
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	sw	a1,-96(s0)
	sw	a2,-92(s0)
	sw	a3,-88(s0)
	sw	a4,-84(s0)
	lhu	a5,16(a5)
	sh	a5,-80(s0)
	li	a5,18
	sw	a5,-48(s0)
	sw	zero,-32(s0)
	j	.L68
.L69:
	lw	a5,-32(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-80(a5)
	li	a2,40
	lw	a1,-32(s0)
	mv	a0,a5
	call	draw_stick
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L68:
	lw	a4,-32(s0)
	lw	a5,-48(s0)
	blt	a4,a5,.L69
	call	delay
	addi	a5,s0,-96
	lw	a1,-48(s0)
	mv	a0,a5
	call	bubbleSort
	call	delay
	j	.L70
.L55:
	call	delay
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	sw	a1,-116(s0)
	sw	a2,-112(s0)
	sw	a3,-108(s0)
	sw	a4,-104(s0)
	lhu	a5,16(a5)
	sh	a5,-100(s0)
	li	a5,18
	sw	a5,-44(s0)
	sw	zero,-36(s0)
	j	.L71
.L72:
	lw	a5,-36(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-100(a5)
	mv	a4,a5
	li	a5,4096
	addi	a2,a5,704
	lw	a1,-36(s0)
	mv	a0,a4
	call	draw_stick
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L71:
	lw	a4,-36(s0)
	lw	a5,-44(s0)
	blt	a4,a5,.L72
	call	delay
	addi	a5,s0,-116
	lw	a1,-44(s0)
	mv	a0,a5
	call	mergeSort
	call	delay
	j	.L55
.L56:
.L73:
	j	.L73
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
