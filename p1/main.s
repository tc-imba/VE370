	.globl	main
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.text
	.align	2
	.globl	countArray
	.set	nomips16
	.set	nomicromips
	.ent	countArray
	.type	countArray, @function
countArray:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$3,$5,-1
	bltz	$3,$L8
	sll	$5,$5,2

	move	$2,$0
	addu	$4,$4,$5
	li	$8,1			# 0x1
	.option	pic0
	b	$L7
	.option	pic2
	li	$7,-1			# 0xffffffffffffffff

$L13:
	addiu	$3,$3,-1
	xori	$5,$5,0x1
	addu	$2,$2,$5
	beq	$3,$7,$L14
	addiu	$4,$4,-4

$L7:
	lw	$5,-4($4)
	beq	$6,$8,$L13
	slt	$5,$5,60

	addiu	$3,$3,-1
	addu	$2,$2,$5
	bne	$3,$7,$L7
	addiu	$4,$4,-4

$L14:
	jr	$31
	nop

$L8:
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	countArray
	.size	countArray, .-countArray
	.align	2
	.globl	Pass
	.set	nomips16
	.set	nomicromips
	.ent	Pass
	.type	Pass, @function
Pass:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	slt	$2,$4,60
	jr	$31
	xori	$2,$2,0x1

	.set	macro
	.set	reorder
	.end	Pass
	.size	Pass, .-Pass
	.align	2
	.globl	Fail
	.set	nomips16
	.set	nomicromips
	.ent	Fail
	.type	Fail, @function
Fail:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	slt	$2,$4,60

	.set	macro
	.set	reorder
	.end	Fail
	.size	Fail, .-Fail
	.ident	"GCC: (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406"
