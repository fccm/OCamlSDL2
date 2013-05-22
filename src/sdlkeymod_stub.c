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

#include <SDL_keycode.h>

#define Val_LShift  Val_int(0)
#define Val_RShift  Val_int(1)
#define Val_LCtrl   Val_int(2)
#define Val_RCtrl   Val_int(3)
#define Val_LAlt    Val_int(4)
#define Val_RAlt    Val_int(5)
#define Val_LGUI    Val_int(6)
#define Val_RGUI    Val_int(7)
#define Val_NUM     Val_int(8)
#define Val_CAPS    Val_int(9)
#define Val_MODE    Val_int(10)

value
Val_SDL_Keymod(SDL_Keymod kmod_mask)
{
    CAMLparam0();
    CAMLlocal2(li, cons);
    li = Val_emptylist;

#define CONS_KMOD(KMOD_Mask, Val_keymod) \
    if (kmod_mask & KMOD_Mask) { \
        cons = caml_alloc(2, 0); \
        Store_field(cons, 0, Val_keymod); \
        Store_field(cons, 1, li); \
        li = cons; \
    }

    CONS_KMOD( KMOD_LSHIFT, Val_LShift )
    CONS_KMOD( KMOD_RSHIFT, Val_RShift )
    CONS_KMOD( KMOD_LCTRL,  Val_LCtrl  )
    CONS_KMOD( KMOD_RCTRL,  Val_RCtrl  )
    CONS_KMOD( KMOD_LALT,   Val_LAlt   )
    CONS_KMOD( KMOD_RALT,   Val_RAlt   )
    CONS_KMOD( KMOD_LGUI,   Val_LGUI   )
    CONS_KMOD( KMOD_RGUI,   Val_RGUI   )
    CONS_KMOD( KMOD_NUM,    Val_NUM    )
    CONS_KMOD( KMOD_CAPS,   Val_CAPS   )
    CONS_KMOD( KMOD_MODE,   Val_MODE   )

#undef CONS_KMOD
    CAMLreturn(li);
}

/* vim: set ts=4 sw=4 et: */
