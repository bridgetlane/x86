	.text
.global log2i
	.type	log2i,@function
log2i:
	# setup
	pushl	%ebp
	movl	%esp, %ebp

	# put 1 on edx and take in num from user and store on eax
	# compare -- if num in eax > 1 on edx, jump
	# otherwise, move 0 into eax to be returned
	movl	$1,%edx
	movl	8(%ebp),%eax
	cmpl	%edx,%eax
	jg L9
	movl 	$0,%eax
	movl	%ebp,%esp
	popl	%ebp
	ret

# add 0 to edx, and jump to L10
L9:
	movl	$0,%edx
	jmp L10

# jump to L11 if num on eax is greater than 1
# otherwise, return what is on edx (num of divisions)
L10:
	cmpl	$1,%eax
	jg L11
	movl	%edx,%eax

# divide and restore num on eax by 2
# (num of divisions)++
# if new num is still greater than 1, jump to L10 again
# this will repeat L10 & L11 until num on eax is <=1
L11:
	sarl	$1,%eax
	incl	%edx
	cmpl	$1,%eax
	jg	L10

	# when num on eax <=1, return the num of divisions on edx
	movl	%edx,%eax

	# tear-down
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	log2i, .-log2i
