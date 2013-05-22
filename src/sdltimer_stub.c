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

CAMLprim value
caml_SDL_GetTicks(value unit)
{
    Uint32 ticks = SDL_GetTicks();
    return Val_long(ticks);
}

CAMLprim value
caml_SDL_GetTicks_d(value unit)
{
    CAMLlocal1(ret);
    static const Uint32 th = 1000;
    Uint32 ticks = SDL_GetTicks();
    Uint32 sec = ticks / th;
    Uint32 msec = ticks - sec * th;
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(sec));
    Store_field(ret, 1, Val_int(msec));
    return ret;
}

CAMLprim value
caml_SDL_Delay(value ms)
{
  SDL_Delay(Long_val(ms));
  return Val_unit;
}

/* vim: set ts=4 sw=4 et: */
