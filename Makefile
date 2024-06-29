SRC = src/ae.c src/anet.c src/zmalloc.c src/monotonic.c
OBJ = ${SRC:.c=.o}

libae.a: $(OBJ)
	$(AR) -rc $@ $(OBJ)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

timer: example/timer.o libae.a
	$(CC) $^ -o $@

echo: example/echo.o libae.a
	$(CC) $^ -o $@

clean:
	rm -f $(OBJ) libae.a example/timer.o timer example/echo.o echo

.PHONY: clean
