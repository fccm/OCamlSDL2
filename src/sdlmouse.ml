(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Mouse event handling *)

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

external get_buttons : unit -> button list
  = "caml_SDL_GetMouseButtons"

external get_pos : unit -> pos
  = "caml_SDL_GetMousePos"

external warp_in_window : Sdlwindow.t -> x:int -> y:int -> unit
  = "caml_SDL_WarpMouseInWindow"

external set_relative_mode : enabled:bool -> unit
  = "caml_SDL_SetRelativeMouseMode"

external show_cursor : toggle:bool -> unit
  = "caml_SDL_ShowCursor"

external cursor_is_shown : unit -> bool
  = "caml_SDL_ShowCursor_Query"

let to_string = function
  | Button_Left   -> "Button_Left"
  | Button_Middle -> "Button_Middle"
  | Button_Right  -> "Button_Right"
  | Button_X1     -> "Button_X1"
  | Button_X2     -> "Button_X2"
  | Button_X3     -> "Button_X3"
  | Button_X4     -> "Button_X4"
  | Button_X5     -> "Button_X5"

let of_string s =
  match String.lowercase_ascii s with
  | "button_left"   -> Button_Left
  | "button_middle" -> Button_Middle
  | "button_right"  -> Button_Right
  | "button_x1"     -> Button_X1
  | "button_x2"     -> Button_X2
  | "button_x3"     -> Button_X3
  | "button_x4"     -> Button_X4
  | "button_x5"     -> Button_X5
  | _ -> invalid_arg "Sdlmouse.of_string"

