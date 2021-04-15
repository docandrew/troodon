all:
	-rm obj/shaders.o
	gprbuild -s -p -Xbuild=release
	strip obj/troodon

debug:
	-rm obj/shaders.o
	gprbuild -s -p -Xbuild=debug

clean:
	-rm obj/*.o
	-rm obj/troodon
	-rm obj/troodond
