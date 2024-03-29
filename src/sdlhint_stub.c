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
 
#include <SDL_hints.h>

CAMLprim value
caml_SDL_SetHint(value hint, value v)
{
    SDL_bool r =
        SDL_SetHint(
                String_val(hint),
                String_val(v));

    return Val_bool(r);
}

CAMLprim value
caml_SDL_SetHintWithPriority(value hint, value v, value prio)
{
    SDL_bool r =
        SDL_SetHintWithPriority(
                String_val(hint),
                String_val(v),
                Int_val(prio));

    return Val_bool(r);
}

/* vim: set ts=4 sw=4 et: */
