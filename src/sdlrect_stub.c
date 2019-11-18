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

#include <SDL_rect.h>
#include "sdlrect_stub.h"

#define Val_none Val_int(0)

static value
Val_some(value v)
{
    value some = caml_alloc(1, 0);
    Store_field(some, 0, v);
    return some;
}

CAMLprim value
caml_SDL_HasIntersection(value a, value b)
{
    SDL_Rect _a;
    SDL_Rect _b;
    SDL_Rect_val(&_a, a);
    SDL_Rect_val(&_b, b);

    SDL_bool r =
        SDL_HasIntersection(&_a, &_b);

    return Val_bool(r);
}

CAMLprim value
caml_SDL_IntersectRectAndLine(value rect, value p1, value p2)
{
    CAMLparam3(rect, p1, p2);
    CAMLlocal2(ret, r);

    SDL_Rect _rect;
    SDL_Rect_val(&_rect, rect);

    int X1 = Int_val(Field(p1, 0));
    int Y1 = Int_val(Field(p1, 1));
    int X2 = Int_val(Field(p2, 0));
    int Y2 = Int_val(Field(p2, 1));

    SDL_bool res =
        SDL_IntersectRectAndLine(
                &_rect,
                &X1, &Y1,
                &X2, &Y2);

    if (res == SDL_TRUE) {
        r = caml_alloc(4, 0);

        Store_field(r, 0, Val_int(X1));
        Store_field(r, 1, Val_int(Y1));
        Store_field(r, 2, Val_int(X2));
        Store_field(r, 3, Val_int(Y2));

        ret = Val_some(r);
    } else {
        ret = Val_none;
    }

    CAMLreturn(ret);
}

/* vim: set ts=4 sw=4 et: */
