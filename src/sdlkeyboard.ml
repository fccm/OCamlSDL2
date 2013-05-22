(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier

 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Keyboard management *)

external start_text_input : unit -> unit
  = "caml_SDL_StartTextInput"

external stop_text_input : unit -> unit
  = "caml_SDL_StopTextInput"

external is_text_input_active : unit -> bool
  = "caml_SDL_IsTextInputActive"

external set_text_input_rect : Sdlrect.t -> unit
  = "caml_SDL_SetTextInputRect"

external has_screen_keyboard_support : unit -> bool
  = "caml_SDL_HasScreenKeyboardSupport"
