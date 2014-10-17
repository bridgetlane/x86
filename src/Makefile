hwk3: hwk3.c
	gcc -O0 -std=c99 -m32 -S hwk3.c -o hwk3.s
	gcc -O0 -std=c99 -m32 -c triple.s
	gcc -O0 -std=c99 -m32 -c log2i.s
	gcc -O0 -std=c99 -m32 -c avgarray.s
	gcc -O0 -std=c99 -m32 -c isprime.s
	gcc -O0 -std=c99 -m32 -c caller.s
	gcc -O0 -std=c99 -m32 -c hwk3.s
	gcc -O0 -std=c99 -m32 -o hwk3 triple.o log2i.o avgarray.o isprime.o caller.o hwk3.o
