LIBS_S := ${wildcard lib/*.s}
LIBS_O := ${LIBS_S:.s=.o}

TARGETS := hello bubble

all: ${TARGETS}

hello: hello.o ${LIBS_O}
	gcc -o $@ $^

bubble: sort.o algorithm/bubble.o ${LIBS_O}
	gcc -o $@ $^

.PHONY: clean

clean:
	find . -type f -name '*.o' -delete
	rm -f ${TARGETS}