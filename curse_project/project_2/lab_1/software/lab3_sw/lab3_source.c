#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <unistd.h>
#include <stdio.h>
#include "sys\alt_stdio.h"
#define NONE_PRESSED 0x1
#define DEBOUNCE 50000

int main (void) {
	int buttons;
	int led = 0x00;

	alt_printf("Привет\nПроцессор Nios II запущен!\n");
	alt_printf("Нажмите кнопку pba на плате miniDiLab-CIV\n\n");

	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, led);

	while (1) {
		buttons = IORD_ALTERA_AVALON_PIO_DATA(BUTTONS_BASE);

		if (buttons != NONE_PRESSED) {
			alt_printf("Нажата кнопка pba\n");

			if (led >= 0x80 || led == 0x00) led = 0x01;
			else led = led << 1;

			IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, ~led);

			usleep(DEBOUNCE);
			while(buttons != NONE_PRESSED)
				buttons = IORD_ALTERA_AVALON_PIO_DATA(BUTTONS_BASE);
			usleep(DEBOUNCE);
		}
	}
}
