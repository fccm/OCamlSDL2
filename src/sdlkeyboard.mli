(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier

 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Keyboard management *)

(** API Doc:
  {{:http://wiki.libsdl.org/moin.fcg/CategoryKeyboard}Keyboard category} *)

external start_text_input : unit -> unit
  = "caml_SDL_StartTextInput"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_StartTextInput}api doc} *)

external stop_text_input : unit -> unit
  = "caml_SDL_StopTextInput"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_StopTextInput}api doc} *)

external is_text_input_active : unit -> bool
  = "caml_SDL_IsTextInputActive"

external set_text_input_rect : Sdlrect.t -> unit
  = "caml_SDL_SetTextInputRect"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_SetTextInputRect}api doc} *)

external has_screen_keyboard_support : unit -> bool
  = "caml_SDL_HasScreenKeyboardSupport"
