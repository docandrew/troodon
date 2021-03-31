# Troodon Includes

These are _thin_ bindings to the various C libraries used by Troodon.

For the most part, these are automatically generated using

```shell
$ g++ -c -fdump-ada-spec -C /usr/include/someheader.h
```

Notes:

In some cases, typically because Ada is case-insensitive and C headers often
use an upper-cased version of the same word for a constant, we have to modify
the names of some of the constants.

Occasionally, weird #define-s (looking at you, Xlib) and other gross abuses of
the C preprocessor cause the spec to have compile issues in Ada. Where I've
made modifications, I've tried to add the comment "Troodon" nearby.
