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

#include <SDL_keyboard.h>
#include "sdlrect_stub.h"

CAMLprim value
caml_SDL_StartTextInput(value unit)
{
    SDL_StartTextInput();
    return Val_unit;
}

CAMLprim value
caml_SDL_StopTextInput(value unit)
{
    SDL_StopTextInput();
    return Val_unit;
}

CAMLprim value
caml_SDL_IsTextInputActive(value unit)
{
    SDL_bool b = SDL_IsTextInputActive();
    return Val_bool(b);
}

CAMLprim value
caml_SDL_SetTextInputRect(value _rect)
{
    SDL_Rect rect;
    SDL_Rect_val(&rect, _rect);
    SDL_SetTextInputRect(&rect);
    return Val_unit;
}

CAMLprim value
caml_SDL_HasScreenKeyboardSupport(value unit)
{
    SDL_bool b = SDL_HasScreenKeyboardSupport();
    return Val_bool(b);
}

/* vim: set ts=4 sw=4 et: */
