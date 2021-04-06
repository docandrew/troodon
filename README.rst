Troodon Desktop Environment
###########################

THIS IS A WORK IN PROGRESS!

Troodon is a Compositing X11 window manager. It uses XCB for communication
with the X Server and renders its decorations and built-in desktop
environment apps and components with OpenGL.

Troodon can be used in both tiling and stacking modes, and the best part is
that it is a single binary!

FAQ
###

What's a Troodon?

Troodon was a small dinosaur, regarded as the most intelligent of the
dinosaur species and that with the highest visual acuity.


Developer Notes
###############

Generate Ada spec for glext.h with:
$ g++ -c -fdump-ada-spec -DGL_GLEXT_PROTOTYPES /usr/include/GL/gl.h


TODOs
#####

call glGetError all over the place.
Optimize font rendering with texture atlas