#include <ctype.h>

/* The zero (0) character. */
#define ZERO 0x30
/* The nine (9) character. */
#define NINE 0x39

int isdigit(int c)
{
	return c >= ZERO && c <= NINE;
}

