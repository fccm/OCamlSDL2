(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Textures *)

type t

external create_from_surface :
  Sdltype.renderer -> Sdlsurface.t -> t
  = "caml_SDL_CreateTextureFromSurface"

external destroy : t -> unit
  = "caml_SDL_DestroyTexture"

external set_blend_mode : t -> SdlblendMode.t -> unit
  = "caml_SDL_SetTextureBlendMode" "noalloc"

external set_alpha_mod : t -> alpha:int -> unit
  = "caml_SDL_SetTextureAlphaMod"

external set_color_mod : t -> int * int * int -> unit
  = "caml_SDL_SetTextureColorMod"

external set_color_mod3 : t -> r:int -> g:int -> b:int -> unit
  = "caml_SDL_SetTextureColorMod3"

