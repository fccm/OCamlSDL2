(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Create and manage windows *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryVideo}Video category} *)

type t

(** {{:http://wiki.libsdl.org/SDL_WindowFlags}api doc} *)
type window_flags =
  | FullScreen
  | OpenGL
  | Shown
  | Hidden
  | Borderless
  | Resizable
  | Minimized
  | Maximized
  | Input_Grabbed
  | Input_Focus
  | Mouse_Focus
  | FullScreen_Desktop
  | Foreign

type window_pos = [ `centered | `undefined | `pos of int ]

external create :
  title:string ->
  pos:window_pos * window_pos ->
  dims:int * int ->
  flags:window_flags list -> t
  = "caml_SDL_CreateWindow"
(** {{:http://wiki.libsdl.org/SDL_CreateWindow}api doc} *)

external create2 :
  title:string ->
  x:window_pos ->
  y:window_pos ->
  width:int ->
  height:int ->
  flags:window_flags list -> t
  = "caml_SDL_CreateWindow2_bc"
    "caml_SDL_CreateWindow2"
(** {{:http://wiki.libsdl.org/SDL_CreateWindow}api doc} *)

external set_title : window:t -> title:string -> unit
  = "caml_SDL_SetWindowTitle"
(** {{:http://wiki.libsdl.org/SDL_SetWindowTitle}api doc} *)

external show : t -> unit = "caml_SDL_ShowWindow"
(** {{:http://wiki.libsdl.org/SDL_ShowWindow}api doc} *)

external hide : t -> unit = "caml_SDL_HideWindow"
(** {{:http://wiki.libsdl.org/SDL_HideWindow}api doc} *)

external raise_win : t -> unit = "caml_SDL_RaiseWindow"
(** {{:http://wiki.libsdl.org/SDL_RaiseWindow}api doc} *)

external maximize : t -> unit = "caml_SDL_MaximizeWindow"
(** {{:http://wiki.libsdl.org/SDL_MaximizeWindow}api doc} *)

external minimize : t -> unit = "caml_SDL_MinimizeWindow"
(** {{:http://wiki.libsdl.org/SDL_MinimizeWindow}api doc} *)

external restore : t -> unit = "caml_SDL_RestoreWindow"
(** {{:http://wiki.libsdl.org/SDL_RestoreWindow}api doc} *)

external get_surface : t -> Sdlsurface.t = "caml_SDL_GetWindowSurface"
(** {{:http://wiki.libsdl.org/SDL_GetWindowSurface}api doc} *)

external update_surface : t -> unit = "caml_SDL_UpdateWindowSurface"
(** {{:http://wiki.libsdl.org/SDL_UpdateWindowSurface}api doc} *)

external destroy : t -> unit = "caml_SDL_DestroyWindow"
(** {{:http://wiki.libsdl.org/SDL_DestroyWindow}api doc} *)

