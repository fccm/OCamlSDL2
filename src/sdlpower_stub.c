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

#include <SDL_power.h>

CAMLprim value
caml_SDL_GetPowerInfo(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);

    int secs, pct;
    SDL_PowerState state = SDL_GetPowerInfo(&secs, &pct);

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_int(state));
    Store_field(ret, 1, Val_int(secs));
    Store_field(ret, 2, Val_int(pct));
    CAMLreturn(ret);
}

/* vim: set ts=4 sw=4 et: */
