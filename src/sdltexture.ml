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

external create :
  Sdltype.renderer -> SdlpixelFormat.t -> SdltextureAccess.t -> int -> int -> t
  = "caml_SDL_CreateTexture"

external create_from_surface :
  Sdltype.renderer -> Sdlsurface.t -> t
  = "caml_SDL_CreateTextureFromSurface"

external destroy : t -> unit
  = "caml_SDL_DestroyTexture"

external set_blend_mode : t -> SdlblendMode.t -> unit
  = "caml_SDL_SetTextureBlendMode" [@@noalloc]

external get_blend_mode : t -> SdlblendMode.t
  = "caml_SDL_GetTextureBlendMode"

external set_alpha_mod : t -> alpha:int -> unit
  = "caml_SDL_SetTextureAlphaMod"

external get_alpha_mod : t -> int
  = "caml_SDL_GetTextureAlphaMod"

external set_color_mod : t -> int * int * int -> unit
  = "caml_SDL_SetTextureColorMod"

external set_color_mod3 : t -> r:int -> g:int -> b:int -> unit
  = "caml_SDL_SetTextureColorMod3"

external get_color_mod : t -> int * int * int
  = "caml_SDL_GetTextureColorMod"

