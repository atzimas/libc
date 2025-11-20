#include <ctype.h>

/* The backspace character. */
#define DEL 127
/* The unit separator character. */
#define US 31

int iscntrl(int c)
{
	return (c >= '\0' && c <= US) || c == DEL ;
}

