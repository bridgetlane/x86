	.text
.global triple
	.type	triple,@function
triple:
	# setup
	pushl	%ebp
	movl	%esp, %ebp
	
	# take in one argument, multiply it by 3, store in %eax to be returned
	movl 	8(%ebp),%eax
	imull 	$3,%eax

	# tear-down
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	triple, .-triple
