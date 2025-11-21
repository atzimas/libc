.section .text
.global setjmp
setjmp:
	/* `env` is stored in %rdi */
	mov	%rbx, (%rdi)	/* env.rbx */
	
	/* %rsp without return addr */
	lea	8(%rsp), %rdx
	mov	%rdx, 8(%rdi)	/* env.rsp */

	/* save the rest of the registers */
	mov	%rbp, 16(%rdi)	/* env.rbp */
	mov	%r12, 24(%rdi)	/* env.r12 */
	mov	%r13, 32(%rdi)	/* env.r13 */
	mov	%r14, 40(%rdi)	/* env.r14 */
	mov	%r15, 48(%rdi)	/* env.r15 */

	/* save return address(ra) */
	lea	(%rsp), %rdx
	mov	%rdx, 56(%rdi)	/* env.ra */
	
	/* done; setjmp always returns 0 */
	xor	%eax, %eax
	ret

