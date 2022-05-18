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

external ex_lock :
  t -> Sdlrect.t option ->  ('a, 'b) Bigarray.kind -> int -> (('a, 'b, Bigarray.c_layout) Bigarray.Array1.t * int) option
  = "caml_SDL_Texture_ba_lock"
(** {{:http://wiki.libsdl.org/SDL_LockTexture}api doc} *)

let lock tex ?rect kind = 
  ex_lock tex rect kind (Bigarray.kind_size_in_bytes kind)

external unlock :
  t -> unit
  = "caml_SDL_Texture_ba_unlock" [@@noalloc]
(** {{:http://wiki.libsdl.org/SDL_UnlockTexture}api doc} *)
