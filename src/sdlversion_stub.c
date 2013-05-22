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

#include <SDL_version.h>

CAMLprim value
caml_SDL_GetCompiledVersion(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);

    SDL_version version;
    SDL_VERSION(&version);

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_int(version.major));
    Store_field(ret, 1, Val_int(version.minor));
    Store_field(ret, 2, Val_int(version.patch));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_GetRunTimeVersion(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);

    SDL_version version;
    SDL_GetVersion(&version);

    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_int(version.major));
    Store_field(ret, 1, Val_int(version.minor));
    Store_field(ret, 2, Val_int(version.patch));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_GetRevisionString(value unit)
{
    const char *rev = SDL_GetRevision();
    return caml_copy_string(rev);
}

CAMLprim value
caml_SDL_GetRevisionNumber(value unit)
{
    int rev = SDL_GetRevisionNumber();
    return Val_int(rev);
}

/* vim: set ts=4 sw=4 et: */
