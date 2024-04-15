#include <unistd.h>

int main(void) {
	char *psw = (char*) 0x8000;
	char *pled = (char*) 0x8010;
	char count = 64;

	while (1) {
		usleep(300000);

		if (((*psw) != 0x00) && (((*psw) - 1) > count))
			count++; /* Continue 0-SW[7:0] counting loop. */
		else
			count = 0; /* start counting loop from 0 */

		*pled = ~count;
	}

	return 0;
}
