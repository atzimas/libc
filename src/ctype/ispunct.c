#include <ctype.h>

int ispunct(int c)
{
	return !isspace(c) || !isalnum(c);
}

