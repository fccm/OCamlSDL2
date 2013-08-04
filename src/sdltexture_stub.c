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
#include "sdlblendMode_stub.h"

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

#define Uint8_val Int_val
CAMLprim value
caml_SDL_SetTextureAlphaMod(value texture, value alpha)
{
    int r =
        SDL_SetTextureAlphaMod(
            SDL_Texture_val(texture),
            Uint8_val(alpha));
    if (r)
        caml_failwith("Sdltexture.set_alpha_mod");
    return Val_unit;
}

CAMLprim value
caml_SDL_SetTextureColorMod(value texture, value rgb)
{
    value r = Field(rgb,0);
    value g = Field(rgb,1);
    value b = Field(rgb,2);
    int s =
        SDL_SetTextureColorMod(
            SDL_Texture_val(texture),
            Uint8_val(r), Uint8_val(g), Uint8_val(b));
    if (s)
        caml_failwith("Sdltexture.set_color_mod");
    return Val_unit;
}

CAMLprim value
caml_SDL_SetTextureColorMod3(
        value texture, value r, value g, value b)
{
    int s =
        SDL_SetTextureColorMod(
            SDL_Texture_val(texture),
            Uint8_val(r), Uint8_val(g), Uint8_val(b));
    if (s)
        caml_failwith("Sdltexture.set_color_mod3");
    return Val_unit;
}
#undef Uint8_val

CAMLprim value
caml_SDL_SetTextureBlendMode(value texture, value blendMode)
{
    int r =
        SDL_SetTextureBlendMode(
            SDL_Texture_val(texture),
            SDL_BlendMode_val(blendMode));
    if (r)
        caml_failwith("Sdltexture.set_blend_mode");
    return Val_unit;
}

/* vim: set ts=4 sw=4 et: */
