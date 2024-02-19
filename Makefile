CFLAGS = -Wall -Wextra -pedantic -I/usr/X11R6/include -I/usr/X11R6/include/freetype2 -L/usr/X11R6/lib -lXft -lX11 -pthread

PREFIX ?= /usr/local
CC ?= cc

all: herbe

config.h: config.def.h
	cp config.def.h config.h

herbe: herbe.c config.h
	$(CC) herbe.c $(CFLAGS) -o herbe

install: herbe
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f herbe ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/herbe

clean:
	rm -f herbe

.PHONY: all install uninstall clean