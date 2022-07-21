# OCaml and SDL 2.0

![OCaml and SDL](
http://openclipart.org/image/250px/svg_to_png/174316/games.png)

## Introduction

OCamlSDL2 is an OCaml interface to the SDL2 library.

If you are searching for OCaml bindings for SDL 1.2
then you should go there instead:
  [ocamlsdl.sf.net](
  http://ocamlsdl.sourceforge.net/)


## Versions

This version of the bindings is known to work with
SDL 2.0.9 or 2.0.10 and OCaml 4.07.1 until 4.13.1


## Compile and Install

Read the file "INSTALL.txt" for instructions about how
to compile and install.


## Opam

You can install ocamlsdl2 with opam.

If you installed SDL2 version 2.0.9 or later you can install the last version:
```
$ opam install ocamlsdl2
```
But if you still use an older version of SDL2 like for example SDL2 version
2.0.6 then you should install a previous version of the bindings:
```
$ opam install ocamlsdl2.0.02
```
To know which version of the SDL2 is on your system, you can use the command:
```
$ sdl2-config --version
```
To install the source directory (tarball release or git clone):
```
$ opam install .
```

To use the current master branch:
```
$ opam pin -y sdl2 https://github.com/fccm/OCamlSDL2.git#master
```


## API Documentation

The API documentation can be browsed online:

https://fccm.github.io/OCamlSDL2/


## Accompanying libraries

There are also bindings for the accompanying libraries:  
(unlike the main ocamlsdl2 these are not tested on Windows yet)

- https://github.com/fccm/OCamlSDL2_TTF
- https://github.com/fccm/OCamlSDL2_Image
- https://github.com/fccm/OCamlSDL2_Mixer
- https://github.com/fccm/OCamlSDL2_Net
- https://github.com/fccm/OCamlSDL2_Gfx


## Dune

If you use Dune to build your project, you can use this instruction
to your dune file:
```
  (libraries sdl2)
```

## License

This software is provided "AS-IS", without any express
or implied warranty.
In no event will the authors be held liable for any
damages arising from the use of this software.

Permission is granted to anyone to use this software
for any purpose, including commercial applications,
and to alter it and redistribute it freely.

