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

#include <SDL_clipboard.h>

CAMLprim value
caml_SDL_SetClipboardText(value text)
{
    int r = SDL_SetClipboardText(String_val(text));
    return Val_int(r);
}

CAMLprim value
caml_SDL_GetClipboardText(value unit)
{
    char * txt = SDL_GetClipboardText();
    return caml_copy_string(txt);
}

CAMLprim value
caml_SDL_HasClipboardText(value unit)
{
    SDL_bool b = SDL_HasClipboardText();
    return Val_bool(b);
}

/* vim: set ts=4 sw=4 et: */
