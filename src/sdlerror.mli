(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Simple error message routines *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryError}Error category} *)

external get_error : unit -> string
  = "caml_SDL_GetError"
(** {{:http://wiki.libsdl.org/SDL_GetError}api doc} *)

external clear_error : unit -> unit
  = "caml_SDL_ClearError"
(** {{:http://wiki.libsdl.org/SDL_ClearError}api doc} *)

