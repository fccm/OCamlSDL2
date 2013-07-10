(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Audio *)

type t

external get_drivers :
  unit -> string array
  = "caml_SDL_GetAudioDrivers"

external init : driver_name:string -> unit
  = "caml_SDL_AudioInit"

external quit : unit -> unit
  = "caml_SDL_AudioQuit"

external get_current_driver : unit -> string
  = "caml_SDL_GetCurrentAudioDriver"

type status =
  | Stopped
  | Playing
  | Paused

external get_status : unit -> status
  = "caml_SDL_GetAudioStatus"

external pause : pause_on:bool -> unit
  = "caml_SDL_PauseAudio"
