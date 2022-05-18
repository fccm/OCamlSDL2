(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2022 Carsten Elton Sørensen
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Texture access with Bigarrays *)


type t = Sdltexture.t

val lock :
  t -> ?rect:Sdlrect.t ->  ('a, 'b) Bigarray.kind -> (('a, 'b, Bigarray.c_layout) Bigarray.Array1.t * int) option
(** {{:http://wiki.libsdl.org/SDL_LockTexture}api doc} *)


external unlock :
  t -> unit
  = "caml_SDL_Texture_ba_unlock" [@@noalloc]
(** {{:http://wiki.libsdl.org/SDL_UnlockTexture}api doc} *)
