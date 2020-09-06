(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2014 Piotr Mardziel
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Surface definition and management *)

type t = Sdlsurface.t

external get_pixels :
  t -> (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
  = "caml_SDL_Surface_ba_get_pixels"

external create_rgb_surface_from :
  pixels:(int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t ->
  width:int -> height:int -> depth:int -> pitch:int ->
  r_mask:int32 ->
  g_mask:int32 ->
  b_mask:int32 ->
  a_mask:int32 -> t
  = "caml_SDL_CreateRGBSurfaceFrom_bytecode"
    "caml_SDL_CreateRGBSurfaceFrom"

