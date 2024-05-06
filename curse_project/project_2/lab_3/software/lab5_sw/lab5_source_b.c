#include "sys\alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <time.h>
#include <unistd.h>
#include <sys\alt_alarm.h>

alt_u32 my_alarm_callback (void* context) {
	alt_printf("Подпрограмма активизирована.\n");
	volatile int* leds_val_ptr = (volatile int*) context;
	if ((*leds_val_ptr) == 0x80) (*leds_val_ptr) = 0x01;
	else (*leds_val_ptr) = (*leds_val_ptr) << 1;
	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, (*leds_val_ptr));
	// IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~(*leds_val_ptr));
	return alt_ticks_per_second();
}

int main() {
	volatile int leds = 0x01;
	static alt_alarm alarm;
	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 0x00);

	if (alt_alarm_start(&alarm, alt_ticks_per_second(), my_alarm_callback, (void*) &leds) < 0)
		alt_printf("No system clock available!\n");
	else
		alt_printf("Процессор Nios II запущен!\n");
	while (1) {}
	return 0;
}
