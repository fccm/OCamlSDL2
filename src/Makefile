# OCamlSDL2 - An OCaml interface to the SDL2 library
# Copyright (C) 2013 Florent Monnier
#
# This software is provided "AS-IS", without any express or implied warranty.
# In no event will the authors be held liable for any damages arising from
# the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it freely.

include Makefile.config

CFLAGS = $(shell sdl2-config --cflags)
LIBS_ = $(shell sdl2-config --static-libs)
LIBS = $(shell ocaml prm.ml $(LIBS_))
OCAML = ocaml
OCAMLDOC = ocamldoc
OCAMLDEP = ocamldep
OCAMLFIND = ocamlfind
OCAMLDIR = $(shell $(OCAMLC) -where)
CC_MM = gcc -MM -I $(OCAMLDIR) $(CFLAGS)
DIRSEP = $(shell $(OCAML) dir_sep.ml)
BINDINGS_DIR = sdl2
PREFIX = 
DESTDIR = $(PREFIX)$(DIRSEP)$(OCAMLDIR)$(DIRSEP)$(BINDINGS_DIR)
DESTDIR_H = $(DESTDIR)$(DIRSEP)include
# This is defined only after make findinstall
OCAMLFINDDESTDIR_H = $(shell $(OCAMLFIND) query sdl2)$(DIRSEP)include
UNINSTALL_DIR = rm -Rf
INSTALL_DIR = mkdir -p
INSTALL_FILES = cp -f
MKDIR = mkdir -p
RMDIR = rmdir
DOC_DIR = doc

.PHONY: all opt byte cmxa cma
all: cma
opt cmxa: sdl2.cmxa
byte cma: sdl2.cma

.PHONY: ba baopt
ba: sdl2-ba.cma
baopt: sdl2-ba.cmxa


ML_FILES_BASE = \
  sdlinit.ml \
  sdlquit.ml \
  sdlrect.ml \
  sdlblendMode.ml \
  sdlsurface.ml \
  sdlwindow.ml \
  sdlrender.ml \
  sdltexture.ml \
  sdlpixelFormat.ml \
  sdlpixel.ml \
  sdlevent.ml \
  sdlkeyboard.ml \
  sdlkeycode.ml \
  sdlscancode.ml \
  sdlkeymod.ml \
  sdlhat.ml \
  sdlmouse.ml \
  sdljoystick.ml \
  sdlclipboard.ml \
  sdltimer.ml \
  sdlaudio.ml \
  sdlfilesystem.ml \
  sdlversion.ml \
  sdlcpuinfo.ml \
  sdlpower.ml \
  sdlrwops.ml \
  sdlerror.ml \
  sdlgl.ml \
  sdlhint.ml \
  #End
ML_FILES = $(ML_FILES_BASE) sdl.ml

ML_FILES_BA_BASE = \
  sdlsurface_ba.ml \
  #End
ML_FILES_BA = $(ML_FILES_BA_BASE) sdlba.ml

CSTUBS = \
  sdlinit_stub.c \
  sdlquit_stub.c \
  sdlrect_stub.c \
  sdlblendMode_stub.c \
  sdlsurface_stub.c \
  sdlwindow_stub.c \
  sdlrender_stub.c \
  sdltexture_stub.c \
  sdlpixelFormat_stub.c \
  sdlpixel_stub.c \
  sdlevent_stub.c \
  sdlkeyboard_stub.c \
  sdlkeymod_stub.c \
  sdlmouse_stub.c \
  sdljoystick_stub.c \
  sdlclipboard_stub.c \
  sdltimer_stub.c \
  sdlgl_stub.c \
  sdlaudio_stub.c \
  sdlfilesystem_stub.c \
  sdlversion_stub.c \
  sdlcpuinfo_stub.c \
  sdlpower_stub.c \
  sdlrwops_stub.c \
  sdlerror_stub.c \
  sdl_platform_stub.c \
  sdlhint_stub.c \
  #End

CSTUBS_BA = \
  sdlsurface_ba_stub.c \
  #End

C_HEADERS = \
  sdlaudio_stub.h \
  sdlblendMode_stub.h \
  sdlkeymod_stub.h \
  sdlpixelFormat_stub.h \
  sdlpixel_stub.h \
  sdlpoint_stub.h \
  sdlrect_stub.h \
  sdlrender_stub.h \
  sdlsurface_stub.h \
  sdltexture_stub.h \
  sdlwindow_stub.h \
  sdlrwops_stub.h \
  #End

CMO_FILES = $(patsubst %.ml, %.cmo, $(ML_FILES))
CMX_FILES = $(patsubst %.ml, %.cmx, $(ML_FILES))
CMI_FILES = $(patsubst %.ml, %.cmi, $(ML_FILES))
MLI_FILES = $(patsubst %.ml, %.mli, $(ML_FILES))

C_STUBS_O = $(patsubst %.c, %.o, $(CSTUBS))

MLI_FILES_BASE = $(patsubst %.ml, %.mli, $(ML_FILES_BASE))



CMO_FILES_BA = $(patsubst %.ml, %.cmo, $(ML_FILES_BA))
CMX_FILES_BA = $(patsubst %.ml, %.cmx, $(ML_FILES_BA))
CMI_FILES_BA = $(patsubst %.ml, %.cmi, $(ML_FILES_BA))
MLI_FILES_BA = $(patsubst %.ml, %.mli, $(ML_FILES_BA))

C_STUBS_BA_O = $(patsubst %.c, %.o, $(CSTUBS_BA))

MLI_FILES_BA_BASE = $(patsubst %.ml, %.mli, $(ML_FILES_BA_BASE))


# Dependencies

#.PHONY: dep
#dep: c_depend.mk ml_depend.mk
#
#-include ml_depend.mk
#ml_depend.mk: $(ML_FILES) $(MLI_FILES)
#	$(OCAMLDEP) $^ > $@
#
#-include c_depend.mk
#cdepend.mk: $(CSTUBS)
#	$(CC_MM) *.c *.h > $@

-include ml_depend.mk
-include c_depend.mk
.PHONY: dep
dep:
	$(OCAMLDEP) sdl.ml sdl.mli sdl*.ml sdl*.mli > ml_depend.mk
	$(CC_MM) *_stub.[ch] > c_depend.mk


.SECONDARY:

sdl.mli: sdl.ml $(MLI_FILES_BASE)
	cat sdl_header > $@
	$(OCAMLC) -i $< >> $@

sdlba.mli: sdlba.ml $(MLI_FILES_BA_BASE)
	cat sdl_header > $@
	$(OCAMLC) -i $< >> $@

%.cmi: %.mli
	$(OCAMLC) $<

%.cmo: %.ml %.cmi
	$(OCAMLC) -c $<

%.cmx: %.ml %.cmi
	$(OCAMLOPT) -c $<

%_stub.o: %_stub.c
	$(OCAMLC) -ccopt "-static $(CFLAGS) -g -O " $<

sdl2.cma: $(CMO_FILES) libsdlstub.a
	$(OCAMLMKLIB) -o sdl2 -oc sdl2_stubs $(CMO_FILES) $(LIBS)

sdl2.cmxa: $(CMX_FILES) libsdlstub.a
	$(OCAMLMKLIB) -o sdl2 -oc sdl2_stubs $(CMX_FILES) $(LIBS)

libsdlstub.a: $(C_STUBS_O)
	$(OCAMLMKLIB) -o sdl2 -oc sdl2_stubs $(C_STUBS_O) $(LIBS)


sdl2-ba.cma: $(CMO_FILES_BA) libsdl2ba_stub.a
	$(OCAMLMKLIB) -o sdl2-ba -oc sdl2ba_stubs $(CMO_FILES_BA) $(LIBS)

sdl2-ba.cmxa: $(CMX_FILES_BA) libsdl2ba_stub.a
	$(OCAMLMKLIB) -o sdl2-ba -oc sdl2ba_stubs $(CMX_FILES_BA) $(LIBS)

libsdl2ba_stub.a: $(C_STUBS_BA_O)
	$(OCAMLMKLIB) -o sdl2-ba -oc sdl2ba_stubs $(C_STUBS_BA_O) $(LIBS)


poly_var.exe: poly_var.ml poly_var_stubs.c
	ocamlopt -o $@ str.cmxa $^

SDL_Event_type.h: SDL_Event_type.lst poly_var.exe
	./poly_var.exe -c $< > $@

%.gen.c: %.var.list
	ocaml variant.ml $< > $@

.PHONY: gen
gen: sdl_scancode.gen.c sdl_keycode.gen.c


# API documentation generation

OCAMLDOC_PRM = -colorize-code -html

.PHONY: doc cmi
cmi: $(CMI_FILES)
doc: $(MLI_FILES) $(MLI_FILES_BA) $(CMI_FILES)
	$(MKDIR) $(DOC_DIR)
	$(OCAMLDOC) $(OCAMLDOC_PRM) \
	  $(MLI_FILES) \
	  $(MLI_FILES_BA) \
	  -d $(DOC_DIR)

.PHONY: cleandoc
cleandoc:
	$(RM) $(DOC_DIR)/*
	$(RMDIR) $(DOC_DIR)

# Installation

.PHONY: findinstall finduninstall findreinstall findinstall_h
findinstall: META sdl2.cma
	$(OCAMLFIND) install $(BINDINGS_DIR) META \
	  *.cm[aix] *.cmx[as] sdl2*.a *sdl2*_stubs.*

finduninstall:
	$(OCAMLFIND) remove $(BINDINGS_DIR)

findreinstall:
	$(MAKE) clean
	$(MAKE) gen
	$(MAKE) dep
	$(MAKE) opt
	$(MAKE) byte
	$(MAKE) ba
	$(MAKE) baopt
	$(MAKE) finduninstall
	$(MAKE) findinstall

findinstall_h:
	$(INSTALL_DIR) $(OCAMLFINDDESTDIR_H)
	$(INSTALL_FILES) \
	  $(C_HEADERS) \
	  $(OCAMLFINDDESTDIR_H)

.PHONY: install uninstall
install:
	$(INSTALL_DIR) $(DESTDIR)
	$(INSTALL_FILES) \
	  *.cm[aix] *.cmx[as] sdl2*.a *sdl2*_stubs.* \
	  $(DESTDIR)

uninstall:
	$(UNINSTALL_DIR) $(DESTDIR)

.PHONY: install_h
install_h:
	$(INSTALL_DIR) $(DESTDIR_H)
	$(INSTALL_FILES) \
	  $(C_HEADERS) \
	  $(DESTDIR_H)

# Dependency visualisation:
# (needs graphviz to be installed)

.PHONY: depviz
depviz: deps.svg
#DEP_VIZ_FILES = sdl.mli sdl*.mli
DEP_VIZ_FILES = \
  sdlpixel.ml sdlwindow.ml sdlrender.ml sdltexture.ml sdlsurface.ml \
  #End

deps.raw: $(DEP_VIZ_FILES)
	$(OCAMLDEP) -modules $^ > $@

deps.dot: deps.raw
	cat style1.dot > deps.dot
	ocaml dep2dot.ml deps.raw >> deps.dot
	echo "}" >> deps.dot

deps.svg: deps.dot
	dot -Tsvg $< -o  $@

# Cleaning

.PHONY: cleandeps
cleandeps:
	$(RM) deps.*

.PHONY: clean
clean:
	$(RM) *.[oas] *.cm[ioax] *.cmx[as] *.so *.dll *.opt *.exe
	$(RM) *.mk *.gen.c sdl.mli

.PHONY: cleanall
cleanall: clean cleandeps cleandoc
	$(RM) *~

# vim: ts=4
