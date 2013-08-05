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
#define Val_uint8(uc) Val_int((int)uc)

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
caml_SDL_GetTextureAlphaMod(value texture)
{
    Uint8 alpha;
    int r =
        SDL_GetTextureAlphaMod(
            SDL_Texture_val(texture),
            &alpha);
    if (r)
        caml_failwith("Sdltexture.get_alpha_mod");
    return Val_uint8(alpha);
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

CAMLprim value
caml_SDL_GetTextureBlendMode(value texture)
{
    SDL_BlendMode blendMode;
    int r =
        SDL_GetTextureBlendMode(
            SDL_Texture_val(texture),
            &blendMode);
    if (r)
        caml_failwith("Sdltexture.get_blend_mode");
    return Val_SDL_BlendMode(blendMode);
}

CAMLprim value
caml_SDL_GetTextureColorMod(value texture)
{
    CAMLparam1(texture);
    CAMLlocal1(rgb);

    Uint8 r, g, b;
    int s =
        SDL_GetTextureColorMod(
            SDL_Texture_val(texture),
            &r, &g, &b);
    if (s)
        caml_failwith("Sdltexture.get_color_mod");

    rgb = caml_alloc(3, 0);
    Store_field(rgb, 0, Val_uint8(r));
    Store_field(rgb, 1, Val_uint8(g));
    Store_field(rgb, 2, Val_uint8(b));
    CAMLreturn(rgb);
}

#undef Val_uint8
#undef Uint8_val

/* vim: set ts=4 sw=4 et: */
