all:
	-rm obj/shaders.o
	gprbuild -Xbuild=release

clean:
	-rm obj/*.o
	-rm obj/troodon