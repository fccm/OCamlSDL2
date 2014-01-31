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
#include <caml/bigarray.h>

#include <SDL_surface.h>
#include "sdlsurface_stub.h"
#include "sdlrect_stub.h"
#include "sdlblendMode_stub.h"
#include "sdlpixelFormat_stub.h"

#include <string.h>

CAMLprim value
caml_SDL_CreateRGBSurface(
        value width,
        value height,
        value depth)
{
    Uint32 flags = 0;
    Uint32 Rmask = 0;
    Uint32 Gmask = 0;
    Uint32 Bmask = 0;
    Uint32 Amask = 0;

    SDL_Surface *surf = SDL_CreateRGBSurface(
        flags,
        Int_val(width),
        Int_val(height),
        Int_val(depth),
        Rmask,
        Gmask,
        Bmask,
        Amask);
    return Val_SDL_Surface(surf);
}

CAMLprim value
caml_SDL_FreeSurface(value surf)
{
    SDL_FreeSurface(SDL_Surface_val(surf));
    return Val_unit;
}

CAMLprim value
caml_SDL_LoadBMP(value filename)
{
    SDL_Surface *surf = SDL_LoadBMP(String_val(filename));
    if (surf == NULL)
        caml_failwith("Sdlsurface.load_bmp");
    return Val_SDL_Surface(surf);
}

CAMLprim value
caml_SDL_SaveBMP(value surf, value filename)
{
    int r = SDL_SaveBMP(SDL_Surface_val(surf), String_val(filename));
    if (r) caml_failwith("Sdlsurface.save_bmp");
    return Val_unit;
}

CAMLprim value
caml_SDL_FillRect(
        value dst,
        value rect,
        value color)
{
    SDL_Rect _rect;
    SDL_Rect_val(&_rect, rect);
    int r = SDL_FillRect(
        SDL_Surface_val(dst), &_rect,
        Int32_val(color));
    if (r) caml_failwith("Sdlsurface.fill_rect");
    return Val_unit;
}

CAMLprim value
caml_SDL_BlitSurface(
        value src, value _srcrect,
        value dst, value _dstrect)
{
    CAMLparam4(src, _srcrect, dst, _dstrect);
    CAMLlocal1(ret);
    SDL_Rect dstrect;
    SDL_Rect srcrect;
    SDL_Rect_val(&dstrect, _dstrect);
    SDL_Rect_val(&srcrect, _srcrect);
    int r = SDL_BlitSurface(
        SDL_Surface_val(src), &srcrect,
        SDL_Surface_val(dst), &dstrect);
    if (r) caml_failwith("Sdlsurface.blit_surface");
    Val_SDL_Rect(ret, &dstrect);
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_Surface_Blit_Pixels(
        value surf, value pixels_buffer)
{
    SDL_Surface *surface = SDL_Surface_val(surf);
    memcpy(surface->pixels,
        String_val(pixels_buffer),
        caml_string_length(pixels_buffer));
    return Val_unit;
}

CAMLprim value
caml_SDL_SetColorKey(value surface, value flag, value key)
{
    /* TODO:
     *  You can pass SDL_RLEACCEL to enable RLE accelerated blits.
     */
    int r = SDL_SetColorKey(
        SDL_Surface_val(surface), Bool_val(flag), Int32_val(key));
    if (r) caml_failwith("Sdlsurface.set_color_key");
    return Val_unit;
}

CAMLprim value
caml_SDL_SurfaceGetWidth(value surface)
{
    return Val_int(SDL_Surface_val(surface)->w);
}

CAMLprim value
caml_SDL_SurfaceGetHeight(value surface)
{
    return Val_int(SDL_Surface_val(surface)->h);
}

CAMLprim value
caml_SDL_SurfaceGetPitch(value surface)
{
    return Val_int(SDL_Surface_val(surface)->pitch);
}

CAMLprim value
caml_SDL_SurfaceGetDims(value surface)
{
    CAMLparam1(surface);
    CAMLlocal1(dims);
    dims = caml_alloc(2, 0);
    Store_field(dims, 0, Val_int(SDL_Surface_val(surface)->w));
    Store_field(dims, 1, Val_int(SDL_Surface_val(surface)->h));
    CAMLreturn(dims);
}

CAMLprim value
caml_SDL_SurfaceGetPixel32(value surface, value x, value y)
{
    int32 *pixels = (int32 *) SDL_Surface_val(surface)->pixels;
    int width = SDL_Surface_val(surface)->w;
    int ofs = (Long_val(y) * width) + Long_val(x);
    return caml_copy_int32(pixels[ofs]);
}

CAMLprim value
caml_SDL_SurfaceGetPixel16(value surface, value x, value y)
{
    Uint16 *pixels = (Uint16 *) SDL_Surface_val(surface)->pixels;
    int width = SDL_Surface_val(surface)->w;
    int ofs = (Long_val(y) * width) + Long_val(x);
    return caml_copy_int32(pixels[ofs]);
}

CAMLprim value
caml_SDL_SurfaceGetPixel8(value surface, value x, value y)
{
    Uint8 *pixels = (Uint8 *) SDL_Surface_val(surface)->pixels;
    int width = SDL_Surface_val(surface)->w;
    int ofs = (Long_val(y) * width) + Long_val(x);
    return caml_copy_int32(pixels[ofs]);
}

CAMLprim value
caml_SDL_SurfaceGetBitsPerPixel(value surface)
{
    return Val_int(
        SDL_Surface_val(surface)->format->BitsPerPixel);
}

static inline SDL_bool
SDL_SurfaceHasPalette(SDL_Surface * surface)
{
    return ((surface->format->palette) != 0);
}

CAMLprim value
caml_SDL_SurfaceHasPalette(value surface)
{
    SDL_bool b = SDL_SurfaceHasPalette(SDL_Surface_val(surface));
    return Val_bool(b);
}

CAMLprim value
caml_SDL_SetSurfaceBlendMode(
        value surface,
        value blendMode)
{
    int r =
        SDL_SetSurfaceBlendMode(
            SDL_Surface_val(surface),
            SDL_BlendMode_val(blendMode));
    if (r) caml_failwith("Sdlsurface.set_blend_mode");
    return Val_unit;
}

CAMLprim value
caml_SDL_Surface_get_pixelformat_t(value surface)
{
    SDL_PixelFormat *pixel_format =
        SDL_Surface_val(surface)->format;

    Uint32 format = pixel_format->format;

    return Val_Sdl_pixelformat_t(format);
}

CAMLprim value
caml_SDL_Surface_get_pixels(value surface)
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
    caml_failwith("Sdlsurface.get_pixels");
  }

  b_flag |= CAML_BA_C_LAYOUT | CAML_BA_EXTERNAL ;

  return caml_ba_alloc(b_flag, 1, surf->pixels, &dim);
}

/* vim: set ts=4 sw=4 et: */
