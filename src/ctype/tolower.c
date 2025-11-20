#include <ctype.h>

int tolower(int c)
{
	if (isalpha(c))
		return c + 32;
	return c;
}
