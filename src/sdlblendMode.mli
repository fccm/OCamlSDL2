(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Blend Modes *)

(** API Doc:
  {{:http://wiki.libsdl.org/SDL_BlendMode}SDL_BlendMode} *)

type t =
  | BNone
  | Blend
  | Add
  | Mod

val to_string : t -> string
val of_string : string -> t

