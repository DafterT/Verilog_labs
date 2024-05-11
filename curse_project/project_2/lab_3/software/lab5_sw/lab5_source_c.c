#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <time.h>
#include <unistd.h>
#include <sys/alt_timestamp.h>

int main() {
	int i;
	alt_u32 num_ticks = 0;
	alt_u32 time1, time2, timer_overhead;
	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 0x00);

	if (alt_timestamp_start() < 0) printf("Проблема инициализации таймера!\n");
	else printf("Процессор Nios II запущен!\n");

	while (1) {
		time1 = alt_timestamp();
		time2 = alt_timestamp();
		timer_overhead = time2 - time1;
		time1 = alt_timestamp();
		for(i = 1; i < 5; i++) {
			switch(i) {
			case 4:
				IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~0xC0);
				printf("LED 11000000\n");
				break;
			case 3:
				IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~0x30);
				printf("LED 00110000\n");
				break;
			case 2:
				IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~0x0C);
				printf("LED 00001100\n");
				break;
			case 1:
				IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~0x03);
				printf("LED 00000011\n");
				break;
			}
			usleep(500000);
		}
		time2 = alt_timestamp();
		num_ticks = time2 - time1 - timer_overhead;
		if (alt_timestamp_start() < 0)
			printf("Проблема инициализации таймера!\n");
		printf("CPU clock (Гц)\t: %u\n", (unsigned int)alt_timestamp_freq());
		printf("Число ticks\t: %u\n", (unsigned int)num_ticks);
		// Процессорное время
		printf("CPU time (ms)\t: %u\n", ((unsigned int)num_ticks * (unsigned int)1000 / ((unsigned int)alt_timestamp_freq()) ));
	}
	return 0;
}
