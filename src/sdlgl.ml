(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* OpenGL windowing *)

type context

external create_context : win:Sdlwindow.t -> context
  = "caml_SDL_GL_CreateContext"

external make_current :
  win:Sdlwindow.t -> ctx:context -> int
  = "caml_SDL_GL_MakeCurrent"

external unload_library : unit -> unit
  = "caml_SDL_GL_UnloadLibrary"

external extension_supported : extension:string -> bool
  = "caml_SDL_GL_ExtensionSupported"

external set_swap_interval : interval:int -> unit
  = "caml_SDL_GL_SetSwapInterval"

external get_swap_interval : unit -> int
  = "caml_SDL_GL_GetSwapInterval"

external swap_window : Sdlwindow.t -> unit
  = "caml_SDL_GL_SwapWindow"

external delete_context : context -> unit
  = "caml_SDL_GL_DeleteContext"

