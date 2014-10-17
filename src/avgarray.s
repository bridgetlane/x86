	.text
.global avgarray
	.type	avgarray,@function
avgarray:
	# setup
	pushl	%ebp
	movl	%esp,%ebp

	# take in the pointer to the array and store in eax
	movl	8(%ebp),%eax

	# designate ecx as counter (start from 0) and edx as sum (start from elm 0)
	movl	$1,%ecx
	movl	(%eax),%edx
	jmp L9

L9:	
	# compare the given array size ('n') with the counter
	cmpl	12(%ebp),%ecx
	
	# if counter < n, jump else calculate average
	jl L10
	
	# push n and sum onto stack and perform division
	fildl	12(%ebp)
	movl	%edx,12(%ebp)
	fildl	12(%ebp)
	fdivp
	
	# return floating point average
	movl	%ebp,%esp
	popl	%ebp
	ret

L10:
	# pull the contents of the pointer
	
	# increment array pointer address to next element
	# add next elm to sum
	# increment the counter
	addl	$4,%eax
	addl	(%eax),%edx
	incl	%ecx
	jmp L9

	# tear-down
	movl	%ebp,%esp
	popl	%ebp
	ret
	.size	avgarray, .-avgarray
