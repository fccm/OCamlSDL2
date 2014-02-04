/* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2014 Piotr Mardziel
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*/
#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/bigarray.h>

#include <SDL_surface.h>
#include "sdlsurface_stub.h"

CAMLprim value
caml_SDL_Surface_ba_get_pixels(value surface)
{
    SDL_Surface *surf = SDL_Surface_val(surface);

    Uint8 bpp = surf->format->BitsPerPixel;
    int b_flag = 0;
    long dim = surf->h;

    switch (bpp) {
      case 8:
        dim *= surf->pitch;
        b_flag |= CAML_BA_UINT8; break;
      case 16:
        dim *= surf->pitch / 2;
        b_flag |= CAML_BA_UINT16; break;
      case 24:
        dim *= surf->pitch;
        b_flag |= CAML_BA_UINT8; break;
      case 32:
        dim *= surf->pitch / 4;
        b_flag |= CAML_BA_INT32; break;
      case 64:
        dim *= surf->pitch / 8;
        b_flag |= CAML_BA_INT64; break;
      default:
        caml_failwith("Sdlsurface_ba.get_pixels");
    }

    b_flag |= CAML_BA_C_LAYOUT | CAML_BA_EXTERNAL ;

    return caml_ba_alloc(b_flag, 1, surf->pixels, &dim);
}

/* vim: set ts=4 sw=4 et: */
