(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Clipboard handling *)

(** API Doc:
  {{:http://wiki.libsdl.org/moin.fcg/CategoryClipboard}Clipboard category} *)

external set_text : text:string -> int
  = "caml_SDL_SetClipboardText"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_SetClipboardText}api doc} *)

external get_text : unit -> string
  = "caml_SDL_GetClipboardText"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GetClipboardText}api doc} *)

external has_text : unit -> bool
  = "caml_SDL_HasClipboardText"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_HasClipboardText}api doc} *)
