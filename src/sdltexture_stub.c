/* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
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
 
#include <SDL_render.h>
#include "sdlrender_stub.h"
#include "sdltexture_stub.h"
#include "sdlsurface_stub.h"

CAMLprim value
caml_SDL_CreateTextureFromSurface(value renderer, value surface)
{
    SDL_Texture *tex =
        SDL_CreateTextureFromSurface(
                SDL_Renderer_val(renderer),
                SDL_Surface_val(surface));
    if (!tex)
        caml_failwith("Sdltexture.create_from_surface");
    return Val_SDL_Texture(tex);
}

CAMLprim value
caml_SDL_DestroyTexture(value texture)
{
    SDL_DestroyTexture(SDL_Texture_val(texture));
    return Val_unit;
}

/* vim: set ts=4 sw=4 et: */
