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

#include <SDL_mouse.h>
#include "sdlwindow_stub.h"

#define SDL_BUTTON_X3       (SDL_BUTTON_X2+1)
#define SDL_BUTTON_X4       (SDL_BUTTON_X2+2)
#define SDL_BUTTON_X5       (SDL_BUTTON_X2+3)
#define SDL_BUTTON_X3MASK   SDL_BUTTON(SDL_BUTTON_X3)
#define SDL_BUTTON_X4MASK   SDL_BUTTON(SDL_BUTTON_X4)
#define SDL_BUTTON_X5MASK   SDL_BUTTON(SDL_BUTTON_X5)

#define Val_SDL_BUTTON_LEFT     Val_int(0)
#define Val_SDL_BUTTON_MIDDLE   Val_int(1)
#define Val_SDL_BUTTON_RIGHT    Val_int(2)
#define Val_SDL_BUTTON_X1       Val_int(3)
#define Val_SDL_BUTTON_X2       Val_int(4)
#define Val_SDL_BUTTON_X3       Val_int(5)
#define Val_SDL_BUTTON_X4       Val_int(6)
#define Val_SDL_BUTTON_X5       Val_int(7)

static value
Val_mouse_button(Uint32 state_mask)
{
    CAMLparam0();
    CAMLlocal2(li, cons);
    li = Val_emptylist;

    if (state_mask & SDL_BUTTON_LMASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_LEFT);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_MMASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_MIDDLE);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_RMASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_RIGHT);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_X1MASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_X1);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_X2MASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_X2);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_X3MASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_X3);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_X4MASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_X4);
        Store_field(cons, 1, li);
        li = cons;
    }
    if (state_mask & SDL_BUTTON_X5MASK) {
        cons = caml_alloc_small(2, Tag_cons);
        Store_field(cons, 0, Val_SDL_BUTTON_X5);
        Store_field(cons, 1, li);
        li = cons;
    }

    CAMLreturn(li);
}

CAMLprim value
caml_SDL_GetMouseState(value unit)
{
    CAMLparam0();
    CAMLlocal2(ret, pos);
    int x, y;
    Uint32 state_mask = SDL_GetMouseState(&x, &y);

    pos = caml_alloc(2, 0);
    Store_field(pos, 0, Val_int(x));
    Store_field(pos, 1, Val_int(y));

    ret = caml_alloc(2, 0);
    Store_field(ret, 0, pos);
    Store_field(ret, 1, Val_mouse_button(state_mask));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_GetMouseButtons(value unit)
{
    CAMLparam0();
    CAMLlocal1(buttons);
    Uint32 state_mask = SDL_GetMouseState(NULL, NULL);
    buttons = Val_mouse_button(state_mask);
    CAMLreturn(buttons);
}

CAMLprim value
caml_SDL_GetMousePos(value unit)
{
    CAMLparam0();
    CAMLlocal1(pos);
    int x, y;
    (void) SDL_GetMouseState(&x, &y);
    pos = caml_alloc(2, 0);
    Store_field(pos, 0, Val_int(x));
    Store_field(pos, 1, Val_int(y));
    CAMLreturn(pos);
}

CAMLprim value
caml_SDL_WarpMouseInWindow(value window, value x, value y)
{
    SDL_WarpMouseInWindow(
            SDL_Window_val(window),
            Int_val(x), Int_val(y));
    return Val_unit;
}

CAMLprim value
caml_SDL_SetRelativeMouseMode(SDL_bool enabled)
{
    int r = SDL_SetRelativeMouseMode(Bool_val(enabled));
    if (r != 0) caml_failwith("Sdlmouse.set_relative_mode");
    return Val_unit;
}

CAMLprim value
caml_SDL_ShowCursor(value toggle)
{
    int shown = SDL_ShowCursor(Int_val(toggle));
    return Val_unit;
}

CAMLprim value
caml_SDL_ShowCursor_Query(value unit)
{
    int shown = SDL_ShowCursor(-1);
    return Val_bool(shown);
}

/* vim: set ts=4 sw=4 et: */
