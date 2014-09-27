(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2014 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Filesystem Paths *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryFilesystem}Filesystem category} *)

external get_base_path : unit -> string = "caml_SDL_GetBasePath"
(** {{:http://wiki.libsdl.org/SDL_GetBasePath}api doc} *)

external get_pref_path : org:string -> app:string -> string
  = "caml_SDL_GetPrefPath"
(** {{:http://wiki.libsdl.org/SDL_GetPrefPath}api doc} *)

