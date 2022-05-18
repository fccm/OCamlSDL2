/* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2022 Carsten Elton Sørensen
 
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
#include <caml/version.h>

#include <SDL_render.h>
#include "sdltexture_stub.h"
#include "sdlrect_stub.h"

#if OCAML_VERSION < 41200
#define Val_none Val_int(0)

static value
Val_some(value v)
{
    CAMLparam1(v);
    CAMLlocal1(some);
    some = caml_alloc(1, 0);
    Store_field(some, 0, v);
    CAMLreturn(some);
}
#else
#define Val_some caml_alloc_some
#endif

CAMLprim value
caml_SDL_Texture_ba_lock(value texture, value rect, value kind, value kind_size)
{
    CAMLparam4(texture, rect, kind, kind_size);
    CAMLlocal2(tuple, ba);

    SDL_Rect sdl_rect;
    SDL_Rect* p_rect = NULL;

    if (Is_some(rect))
    {
        p_rect = &sdl_rect;
        SDL_Rect_val(p_rect, Some_val(rect));
    }

    SDL_Texture* sdl_texture = SDL_Texture_val(texture);

    void* pixels;
    int pitch;

    int r =
        SDL_LockTexture(
            sdl_texture,
            p_rect,
            &pixels,
            &pitch);

    if (r != 0)
    {
        CAMLreturn(Val_none);
    }

    pitch /= Int_val(kind_size);

    int height;
    if (p_rect != NULL) {
        height = p_rect->h;
    } else {
        SDL_QueryTexture(sdl_texture, NULL, NULL, NULL, &height);
    }

    long dim = height * pitch;
    int b_flag = Caml_ba_kind_val(kind) | CAML_BA_C_LAYOUT | CAML_BA_EXTERNAL ;

    tuple = caml_alloc_tuple(2);
    ba = caml_ba_alloc_dims(b_flag, 1, pixels, dim);
    Store_field(tuple, 0, ba);
    Store_field(tuple, 1, Val_int(pitch));

    CAMLreturn(Val_some(tuple));
}


CAMLprim value
caml_SDL_Texture_ba_unlock(value texture)
{
    SDL_UnlockTexture(SDL_Texture_val(texture));

    return Val_unit;
}


/* vim: set ts=4 sw=4 et: */

