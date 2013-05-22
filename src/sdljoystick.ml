(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Joystick event handling *)

type t

external num_joysticks : unit -> int
  = "caml_SDL_NumJoysticks"

external name_for_index : device_index:int -> string
  = "caml_SDL_JoystickNameForIndex"

external j_open : device_index:int -> t
  = "caml_SDL_JoystickOpen"

external close : t -> unit
  = "caml_SDL_JoystickClose"

external num_axes : t -> int
  = "caml_SDL_JoystickNumAxes"

external num_hats : t -> int
  = "caml_SDL_JoystickNumHats"

external get_axis : t -> axis:int -> int
  = "caml_SDL_JoystickGetAxis"

external get_button : t -> button:int -> int
  = "caml_SDL_JoystickGetButton"
