(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Textures *)

(** An efficient driver-specific representation of pixel data. *)

type t

external create_from_surface :
  Sdltype.renderer -> Sdlsurface.t -> t
  = "caml_SDL_CreateTextureFromSurface"
(** {{:http://wiki.libsdl.org/moin.cgi/SDL_CreateTextureFromSurface}api doc} *)

external destroy : t -> unit
  = "caml_SDL_DestroyTexture"
(** {{:http://wiki.libsdl.org/moin.cgi/SDL_DestroyTexture}api doc} *)

external set_blend_mode : t -> SdlblendMode.t -> unit
  = "caml_SDL_SetTextureBlendMode" "noalloc"
(** {{:http://wiki.libsdl.org/moin.cgi/SDL_SetTextureBlendMode}api doc} *)

external set_alpha_mod : t -> alpha:int -> unit
  = "caml_SDL_SetTextureAlphaMod"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_SetTextureAlphaMod}api doc} *)

external set_color_mod : t -> int * int * int -> unit
  = "caml_SDL_SetTextureColorMod"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_SetTextureColorMod}api doc} *)

external set_color_mod3 : t -> r:int -> g:int -> b:int -> unit
  = "caml_SDL_SetTextureColorMod3"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_SetTextureColorMod}api doc} *)

