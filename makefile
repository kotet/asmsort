all: hello

hello: hello.o lib/putstr.o lib/putint.o lib/getc.o lib/getint.o
	gcc -o $@ $^

.PHONY: clean

clean:
	find . -type f -name '*.o' -delete
	rm -f hello