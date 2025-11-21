#ifndef __SETJMP_H__
#define __SETJMP_H__

typedef struct {
	unsigned long long rbx;
	unsigned long long rsp;
	unsigned long long rbp;
	unsigned long long r12;
	unsigned long long r13;
	unsigned long long r14;
	unsigned long long r15;
	unsigned long long ra;
} jmp_buf[1];

int setjmp(jmp_buf env);
#define setjmp setjmp

void longjump(jmp_buf env, int val);

#endif

