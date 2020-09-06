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

#include <SDL.h>
#include <SDL_pixels.h>
#include "sdlpixelFormat_stub.h"

CAMLprim value
caml_SDL_GetPixelFormatName(value format)
{
    const char * name = SDL_GetPixelFormatName(Sdl_pixelformat_t(format));
    return caml_copy_string(name);
}

static value Val_SDL_PixelFormat(SDL_PixelFormat * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_PixelFormat * SDL_PixelFormat_val(value v)
{
    return (SDL_PixelFormat *) Nativeint_val(v);
}

CAMLprim value
caml_SDL_AllocFormat(value pixel_format)
{
    SDL_PixelFormat * px_fmt = SDL_AllocFormat(Sdl_pixelformat_t(pixel_format));
    return Val_SDL_PixelFormat(px_fmt);
}

CAMLprim value
caml_SDL_FreeFormat(value format)
{
    SDL_FreeFormat(SDL_PixelFormat_val(format));
    return Val_unit;
}

#define UInt32_val(v)   Int32_val((v))
#define UInt8_val Int_val
#define Val_uint8 Val_int

CAMLprim value
caml_SDL_MapRGB(value format, value rgb)
{
    value r = Field(rgb,0);
    value g = Field(rgb,1);
    value b = Field(rgb,2);
    Uint32 px = SDL_MapRGB(
            SDL_PixelFormat_val(format),
            UInt8_val(r),
            UInt8_val(g),
            UInt8_val(b));

    return caml_copy_int32(px);
}

CAMLprim value
caml_SDL_MapRGBA(value format, value rgba)
{
    value r = Field(rgba,0);
    value g = Field(rgba,1);
    value b = Field(rgba,2);
    value a = Field(rgba,3);
    Uint32 px = SDL_MapRGBA(
            SDL_PixelFormat_val(format),
            UInt8_val(r),
            UInt8_val(g),
            UInt8_val(b),
            UInt8_val(a));

    return caml_copy_int32(px);
}

CAMLprim value
caml_SDL_GetRGB(value pixel, value format)
{
    CAMLparam2(pixel, format);
    CAMLlocal1(ret);

    Uint8 r, g, b;
    SDL_GetRGB(
        UInt32_val(pixel),
        SDL_PixelFormat_val(format),
        &r, &g, &b);

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_uint8(r));
    Store_field(ret, 1, Val_uint8(g));
    Store_field(ret, 2, Val_uint8(b));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_GetRGBA(value pixel, value format)
{
    CAMLparam2(pixel, format);
    CAMLlocal1(ret);

    Uint8 r, g, b, a;
    SDL_GetRGBA(
        UInt32_val(pixel),
        SDL_PixelFormat_val(format),
        &r, &g, &b, &a);

    ret = caml_alloc(4, 0);
    Store_field(ret, 0, Val_uint8(r));
    Store_field(ret, 1, Val_uint8(g));
    Store_field(ret, 2, Val_uint8(b));
    Store_field(ret, 3, Val_uint8(a));
    CAMLreturn(ret);
}

/* vim: set ts=4 sw=4 et: */
