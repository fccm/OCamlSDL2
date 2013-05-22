(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* SDL version used *)

type version = int * int * int

external get_runtime_version : unit -> version
  = "caml_SDL_GetRunTimeVersion"

external get_compiled_version : unit -> version
  = "caml_SDL_GetCompiledVersion"

external get_revision_string : unit -> string
  = "caml_SDL_GetRevisionString"

external get_revision_number : unit -> int
  = "caml_SDL_GetRevisionNumber"

module R = struct
(* record version type *)
type version = {
  major: int;
  minor: int;
  patch: int;
}

external get_runtime_version : unit -> version
  = "caml_SDL_GetRunTimeVersion"

external get_compiled_version : unit -> version
  = "caml_SDL_GetCompiledVersion"
end

