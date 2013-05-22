# OCamlSDL2 - An OCaml interface to the SDL2 library
# Copyright (C) 2013 Florent Monnier
#
# This software is provided "AS-IS", without any express or implied warranty.
# In no event will the authors be held liable for any damages arising from
# the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it freely.

OCAML := ocaml
OCAMLC := ocamlc -g
OCAMLOPT := ocamlopt -g
#INC_DIR := +sdl2
INC_DIR := ../src
FILE := 
OUT_BIN := "$(shell basename $(FILE) .ml).exe"

all:

test:
	$(OCAMLOPT) -I $(INC_DIR) sdl2.cmxa \
	  $(FILE) -o $(OUT_BIN)

clean:
	$(RM) *.[oas] *.cm[ioax] *.cmx[as] *.so *.dll *.opt *.exe

.PHONY: all clean test
