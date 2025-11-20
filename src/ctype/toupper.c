#include <ctype.h>

int toupper(int c)
{
	if (isalpha(c))
		return c - 32;
	return c;
}

