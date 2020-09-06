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

#include <SDL_joystick.h>

CAMLprim value
caml_SDL_NumJoysticks(value unit)
{
    int num = SDL_NumJoysticks();
    return Val_int(num);
}

CAMLprim value
caml_SDL_JoystickNameForIndex(value device_index)
{
    const char *name = SDL_JoystickNameForIndex(Int_val(device_index));
    return caml_copy_string(name);
}

static value Val_SDL_Joystick(SDL_Joystick * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_Joystick * SDL_Joystick_val(value v)
{
    return (SDL_Joystick *) Nativeint_val(v);
}

CAMLprim value
caml_SDL_JoystickOpen(value device_index)
{
    SDL_Joystick *joy = SDL_JoystickOpen(Int_val(device_index));
    return Val_SDL_Joystick(joy);
}

CAMLprim value
caml_SDL_JoystickClose(value joystick)
{
    SDL_JoystickClose(SDL_Joystick_val(joystick));
    return Val_unit;
}

CAMLprim value
caml_SDL_JoystickNumAxes(value joystick)
{
    int num = SDL_JoystickNumAxes(
            SDL_Joystick_val(joystick));
    return Val_int(num);
}

CAMLprim value
caml_SDL_JoystickNumHats(value joystick)
{
    int num = SDL_JoystickNumHats(SDL_Joystick_val(joystick));
    return Val_int(num);
}

CAMLprim value
caml_SDL_JoystickGetAxis(value joystick, value axis)
{
    Sint16 state = SDL_JoystickGetAxis(
            SDL_Joystick_val(joystick),
            Int_val(axis));
    return Val_int(state);
}

CAMLprim value
caml_SDL_JoystickGetButton(value joystick, value button)
{
    Uint8 state = SDL_JoystickGetButton(
            SDL_Joystick_val(joystick),
            Int_val(button));
    return Val_int(state);
}

/* vim: set ts=4 sw=4 et: */
