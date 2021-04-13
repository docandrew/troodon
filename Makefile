all:
	-rm obj/shaders.o
	gprbuild -p -Xbuild=release

clean:
	-rm obj/*.o
	-rm obj/troodon
