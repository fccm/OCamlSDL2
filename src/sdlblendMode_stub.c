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

#include <SDL_blendmode.h>

#define Val_Sdl_BlendMode_None  Val_int(0)
#define Val_Sdl_BlendMode_Blend Val_int(1)
#define Val_Sdl_BlendMode_Add   Val_int(2)
#define Val_Sdl_BlendMode_Mod   Val_int(3)

value
Val_SDL_BlendMode(SDL_BlendMode blend_mode)
{
    switch (blend_mode) {
        case SDL_BLENDMODE_NONE:  return Val_Sdl_BlendMode_None;
        case SDL_BLENDMODE_BLEND: return Val_Sdl_BlendMode_Blend;
        case SDL_BLENDMODE_ADD:   return Val_Sdl_BlendMode_Add;
        case SDL_BLENDMODE_MOD:   return Val_Sdl_BlendMode_Mod;
    }
    caml_failwith("SdlblendMode.t");
}

const SDL_BlendMode ocaml_SDL_BlendMode_table[] = {
    SDL_BLENDMODE_NONE,
    SDL_BLENDMODE_BLEND,
    SDL_BLENDMODE_ADD,
    SDL_BLENDMODE_MOD,
};

/* vim: set ts=4 sw=4 et: */
