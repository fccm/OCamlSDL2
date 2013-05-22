(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier

 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Create and manage windows *)
type t

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

external create :
  title:string ->
  x:int -> y:int ->
  width:int -> height:int ->
  flags:window_flags list -> t
  = "caml_SDL_CreateWindow_bc"
    "caml_SDL_CreateWindow"

external set_window_title : window:t -> title:string -> unit
  = "caml_SDL_SetWindowTitle"

external show : t -> unit = "caml_SDL_ShowWindow"
external hide : t -> unit = "caml_SDL_HideWindow"
external raise_win : t -> unit = "caml_SDL_RaiseWindow"
external maximize : t -> unit = "caml_SDL_MaximizeWindow"
external minimize : t -> unit = "caml_SDL_MinimizeWindow"
external restore : t -> unit = "caml_SDL_RestoreWindow"

external get_surface :
  t -> Sdlsurface.t
  = "caml_SDL_GetWindowSurface"

external update_surface : t -> unit
  = "caml_SDL_UpdateWindowSurface"

external destroy : t -> unit
  = "caml_SDL_DestroyWindow"
