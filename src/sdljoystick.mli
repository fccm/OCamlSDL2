(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Joystick event handling *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryJoystick}Joystick category} *)

type t

external num_joysticks : unit -> int
  = "caml_SDL_NumJoysticks"
(** {{:http://wiki.libsdl.org/SDL_NumJoysticks}api doc} *)

external name_for_index : device_index:int -> string
  = "caml_SDL_JoystickNameForIndex"
(** {{:http://wiki.libsdl.org/SDL_JoystickNameForIndex}api doc} *)

external j_open : device_index:int -> t
  = "caml_SDL_JoystickOpen"
(** {{:http://wiki.libsdl.org/SDL_JoystickOpen}api doc} *)

external close : t -> unit
  = "caml_SDL_JoystickClose"
(** {{:http://wiki.libsdl.org/SDL_JoystickClose}api doc} *)

external num_axes : t -> int
  = "caml_SDL_JoystickNumAxes"
(** {{:http://wiki.libsdl.org/SDL_JoystickNumAxes}api doc} *)

external num_hats : t -> int
  = "caml_SDL_JoystickNumHats"
(** {{:http://wiki.libsdl.org/SDL_JoystickNumHats}api doc} *)

external get_axis : t -> axis:int -> int
  = "caml_SDL_JoystickGetAxis"
(** {{:http://wiki.libsdl.org/SDL_JoystickGetAxis}api doc} *)

external get_button : t -> button:int -> int
  = "caml_SDL_JoystickGetButton"
(** {{:http://wiki.libsdl.org/SDL_JoystickGetButton}api doc} *)

