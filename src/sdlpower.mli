(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Power management *)

type power_state = [
  | `powerstate_Unknown      (** cannot determine power status *)
  | `powerstate_On_Battery   (** Not plugged in, running on the battery *)
  | `powerstate_No_Battery   (** Plugged in, no battery available *)
  | `powerstate_Charging     (** Plugged in, charging battery *)
  | `powerstate_Charged      (** Plugged in, battery charged *)
  ]

external get_power_info : unit -> power_state * int * int
  = "caml_SDL_GetPowerInfo"
