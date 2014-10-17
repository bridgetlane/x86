	.text
.global isprime
	.type	isprime,@function
isprime:
	# setup
	pushl	%ebp
	movl	%esp,%ebp

	# if the given num ('n') is >1, jump to L8, else return false (0x0)
	movl	$1,%edx
	movl	8(%ebp),%eax
	cmpl	%edx,%eax
	jg L8
	movl	$0,%eax
	movl	%ebp,%esp
	popl	%ebp
	ret

# move up from 2 to n-1, and if any number divides the
# number evenly, return false, else return true (0x1) 

# L8 is the initial set-up only run once, put 2 on ecx ('marker') and jump to L9
L8:
	movl	$2,%ecx
	jmp L9

# this block will be run repetitively with a changing marker
# if marker < n, jump L10
# if marker > n, jump L12
# if marker == n, return true
L9:	
	cmpl	%eax,%ecx
	jl L10
	jg L12

	movl	$1,%eax
	movl	%ebp,%esp
	popl	%ebp
	ret

# while marker is less than n, find n % marker == 0 ? ret false : marker++ and jump L9
L10:
	# setup
	movl	$0,%edx
	movl	8(%ebp),%eax
	
	# divide %eax (num) by %ecx (count) and store remainder in %edx
	idivl	%ecx
	cmpl	$0,%edx
	
	# if remainder (%edx) == 0, return false, else jump L11
	jne L11

	movl	%edx,%eax
	movl	%ebp,%esp
	popl	%ebp
	ret
	
# marker++, jump L9
L11:
	incl	%ecx
	jmp L9

# if marker has been incremented to the point where marker > n, return true
L12:
	movl	$1,%eax
	movl	%ebp,%esp
	popl	%ebp
	ret
	.size	isprime, .-isprime
