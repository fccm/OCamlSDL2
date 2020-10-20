(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Mouse event handling *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryMouse}Mouse category} *)

type button =
  | Button_Left
  | Button_Middle
  | Button_Right
  | Button_X1
  | Button_X2
  | Button_X3
  | Button_X4
  | Button_X5

type pos = int * int

external get_state : unit -> pos * button list
  = "caml_SDL_GetMouseState"
(** {{:http://wiki.libsdl.org/SDL_GetMouseState}api doc} *)

external get_buttons : unit -> button list
  = "caml_SDL_GetMouseButtons"

external get_pos : unit -> pos
  = "caml_SDL_GetMousePos"

external warp_in_window : Sdlwindow.t -> x:int -> y:int -> unit
  = "caml_SDL_WarpMouseInWindow"
(** {{:http://wiki.libsdl.org/SDL_WarpMouseInWindow}api doc} *)

external set_relative_mode : enabled:bool -> unit
  = "caml_SDL_SetRelativeMouseMode"
(** {{:http://wiki.libsdl.org/SDL_SetRelativeMouseMode}api doc} *)

external show_cursor : toggle:bool -> unit
  = "caml_SDL_ShowCursor"
(** {{:http://wiki.libsdl.org/SDL_ShowCursor}api doc} *)

external cursor_is_shown : unit -> bool
  = "caml_SDL_ShowCursor_Query"
(** {{:http://wiki.libsdl.org/SDL_ShowCursor}api doc} *)

val to_string : button -> string
val of_string : string -> button

