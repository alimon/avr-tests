CC=avr-gcc
OBJCOPY=avr-objcopy
RUN=sudo avrdude

RM=rm -f

VERSION=__AVR_ATmega328P__

all: main.hex

main.hex: main.o
	$(OBJCOPY) -O ihex $< $@

main.o: main.c
	$(CC) -c $< -D$(VERSION)

clean:
	$(RM) main.o
	$(RM) main.hex

load: main.hex
	$(RUN) -c usbtiny -pm328p -U flash:w:$<
