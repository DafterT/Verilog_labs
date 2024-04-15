#include <unistd.h>

int main(void) {
	int *psw = (int*) 0x8000;
	int *pled = (int*) 0x8010;
	int count = 64;
	while (1) {
		usleep(100000);
		if (*psw == 0x1)
			count++;
		else
			count--;
		*pled = ~count;
	}
	return 0;
}
