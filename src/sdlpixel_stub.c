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

static const Uint32 caml_table_sdl_pixelformat[] = {
    SDL_PIXELFORMAT_UNKNOWN,
    SDL_PIXELFORMAT_INDEX1LSB,
    SDL_PIXELFORMAT_INDEX1MSB,
    SDL_PIXELFORMAT_INDEX4LSB,
    SDL_PIXELFORMAT_INDEX4MSB,
    SDL_PIXELFORMAT_INDEX8,
    SDL_PIXELFORMAT_RGB332,
    SDL_PIXELFORMAT_RGB444,
    SDL_PIXELFORMAT_RGB555,
    SDL_PIXELFORMAT_BGR555,
    SDL_PIXELFORMAT_ARGB4444,
    SDL_PIXELFORMAT_RGBA4444,
    SDL_PIXELFORMAT_ABGR4444,
    SDL_PIXELFORMAT_BGRA4444,
    SDL_PIXELFORMAT_ARGB1555,
    SDL_PIXELFORMAT_RGBA5551,
    SDL_PIXELFORMAT_ABGR1555,
    SDL_PIXELFORMAT_BGRA5551,
    SDL_PIXELFORMAT_RGB565,
    SDL_PIXELFORMAT_BGR565,
    SDL_PIXELFORMAT_RGB24,
    SDL_PIXELFORMAT_BGR24,
    SDL_PIXELFORMAT_RGB888,
    SDL_PIXELFORMAT_RGBX8888,
    SDL_PIXELFORMAT_BGR888,
    SDL_PIXELFORMAT_BGRX8888,
    SDL_PIXELFORMAT_ARGB8888,
    SDL_PIXELFORMAT_RGBA8888,
    SDL_PIXELFORMAT_ABGR8888,
    SDL_PIXELFORMAT_BGRA8888,
    SDL_PIXELFORMAT_ARGB2101010,
    SDL_PIXELFORMAT_YV12,
    SDL_PIXELFORMAT_IYUV,
    SDL_PIXELFORMAT_YUY2,
    SDL_PIXELFORMAT_UYVY,
    SDL_PIXELFORMAT_YVYU,
};

#define Sdl_pixelformat_t(v) \
    caml_table_sdl_pixelformat[Long_val(v)]

CAMLprim value
caml_SDL_GetPixelFormatName(value format)
{
    const char * name = SDL_GetPixelFormatName(Sdl_pixelformat_t(format));
    return caml_copy_string(name);
}

#define Val_SDL_PixelFormat(format) ((value)(format))
#define SDL_PixelFormat_val(format) ((SDL_PixelFormat *)(format))

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
caml_SDL_MapRGB(value format, value r, value g, value b)
{
    Uint32 px = SDL_MapRGB(
            SDL_PixelFormat_val(format),
            UInt8_val(r),
            UInt8_val(g),
            UInt8_val(b));

    return caml_copy_int32(px);
}

CAMLprim value
caml_SDL_MapRGBA(value format, value r, value g, value b, value a)
{
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
