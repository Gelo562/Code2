.PHONY: clean
.SUFFIXES: .c .o .a .so
%.o: %.c
	gcc -c $<
libpole.a: kwadrat.o podajdane.o
	ar rs $@ $^
libobj.so: szescian.o
	gcc -shared -o $@ $^
%: %.o libpole.a libobj.so
	gcc -o $@ $^
Code2: Code2.o libpole.a libobj.so
Code2.o: Code2.c kwlib.h
kwadrat.o: kwadrat.c
podajdane.o: podajdane.c
szescian.o: szescian.c
clean:
	rm -f Code2 *.o *.a *.so
