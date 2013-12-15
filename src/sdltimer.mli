(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Time management *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryTimer}Timer category} *)

external get_ticks : unit -> int = "caml_SDL_GetTicks" "noalloc"
(** {{:http://wiki.libsdl.org/SDL_GetTicks}api doc} *)

module D : sig
  external get_ticks : unit -> int * int = "caml_SDL_GetTicks_d"
  (** (seconds, milliseconds) *)
end

external delay : ms:int -> unit = "caml_SDL_Delay"
(** {{:http://wiki.libsdl.org/SDL_Delay}api doc} *)

(* vim: set ts=2 sw=2 et: *)
