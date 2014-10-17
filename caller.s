	.text
.global caller
	.type	caller,@function
caller:
	#setup
	pushl	%ebp
	movl	%esp,%ebp

	# take in an int n and create a new int m = 2*n - 1
	movl	8(%ebp),%edx
	imull	$2,%edx
	decl	%edx
	push	%edx

	call	isprime
	addl	$12,%esp

	# tear-down
	movl	%ebp,%esp
	popl	%ebp
	ret
	.size	caller, .-caller
