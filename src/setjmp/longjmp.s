.section .text
.global longjmp
longjmp:
	/* %esi = val; */
	xor	%eax, %eax
	cmp	$1, %esi	/* CF = val ? 0 : 1; */
	adc	%esi, %eax	/* %eax = val + !val; */

	/* %rdi contains saved calling env - restore it */
	mov	(%rdi), %rbx	/* env.rbx */
	mov	8(%rdi), %rsp	/* env.rsp */
	mov	16(%rdi), %rbp	/* env.rbp */
	mov	24(%rdi), %r12	/* env.r12 */
	mov	32(%rdi), %r13	/* env.r13 */
	mov	40(%rdi), %r14	/* env.r14 */
	mov	48(%rdi), %r15	/* env.r15 */

	/* done: jump to saved return addr */
	jmp	*56(%rdi)	/* return env.ra; */

