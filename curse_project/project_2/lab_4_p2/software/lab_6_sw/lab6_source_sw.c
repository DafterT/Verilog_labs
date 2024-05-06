#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <time.h>
#include <unistd.h>
#include <sys/alt_timestamp.h>

int main() {
	int led;
	int in_a;
	int in_b;
	alt_u32 num_ticks = 0;
	alt_u32 time1, time2, timer_overhead;

	if (alt_timestamp_start() < 0) printf("�������� ������������� �������!\n");
	else printf("��������� Nios II �������!\n");
	printf("������� ���������� - CPU Clock (��): %u\n", (unsigned int)alt_timestamp_freq());

	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 0x00);
	while(1) {
		if (alt_timestamp_start() < 0)
			printf("�������� ������������� �������!\n");
		time1 = alt_timestamp();
		time2 = alt_timestamp();
		timer_overhead = time2 - time1;

		in_a = IORD_ALTERA_AVALON_PIO_DATA(DATA_A_BASE);
		in_b = IORD_ALTERA_AVALON_PIO_DATA(DATA_B_BASE);
		time1 = alt_timestamp();
		//led = (in_a + in_b) * in_a - in_a;
		led = ALT_CI_CI_018_0(in_a, in_b);
		time2 = alt_timestamp();
		num_ticks = time2 - time1 - timer_overhead;

		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~led);
		printf("���������: %u\t\t����� ticks: %u\n", (unsigned int) led, (unsigned int) num_ticks);
		usleep(500000);
	}
	return 0;
}
