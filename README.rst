Developer Notes
###############

Generate Ada spec for glext.h with:
$ g++ -c -fdump-ada-spec -DGL_GLEXT_PROTOTYPES /usr/include/GL/gl.h


TODOs
#####

call glGetError all over the place.
Optimize font rendering with texture atlas