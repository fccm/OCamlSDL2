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
#include <caml/callback.h>
#include <SDL.h>

int main(int argc, char *argv[])
{
    caml_main(argv);
    return 0;
}

static inline Uint32
sdlinit_val(value v)
{
  if (v == caml_hash_variant("TIMER"))          return SDL_INIT_TIMER;
  if (v == caml_hash_variant("AUDIO"))          return SDL_INIT_AUDIO;
  if (v == caml_hash_variant("VIDEO"))          return SDL_INIT_VIDEO;
  if (v == caml_hash_variant("JOYSTICK"))       return SDL_INIT_JOYSTICK;
  if (v == caml_hash_variant("HAPTIC"))         return SDL_INIT_HAPTIC;
  if (v == caml_hash_variant("GAMECONTROLLER")) return SDL_INIT_GAMECONTROLLER;
  if (v == caml_hash_variant("EVERYTHING"))     return SDL_INIT_EVERYTHING;
  if (v == caml_hash_variant("NOPARACHUTE"))    return SDL_INIT_NOPARACHUTE;
  return 0x00000000;
}

static inline Uint32
Sdl_init_val(value mask_list)
{
    Uint32 c_mask = 0; 
    while (mask_list != Val_emptylist)
    {
        value head = Field(mask_list, 0);
        c_mask |= sdlinit_val(head);
        mask_list = Field(mask_list, 1);
    }
    return c_mask;
}

CAMLprim value
caml_SDL_Init(value init_flags)
{
    int r = SDL_Init(Sdl_init_val(init_flags));
    if (r < 0) caml_failwith("Sdl.init");
    return Val_unit;
}

CAMLprim value
caml_SDL_InitSubSystem(value init_flags)
{
    int r = SDL_InitSubSystem(Sdl_init_val(init_flags));
    if (r < 0) caml_failwith("Sdl.init_subsystem");
    return Val_unit;
}

/* TODO
Uint32 SDL_WasInit(Uint32 flags);
*/

/* vim: set ts=4 sw=4 et: */
