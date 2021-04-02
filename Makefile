all:
	-rm obj/shaders.o
	gprbuild

clean:
	-rm obj/*.o
	-rm obj/troodon