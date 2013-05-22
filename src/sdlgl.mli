(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** OpenGL windowing *)
(** This module provides windowing for OpenGL applications *)

(** API Doc:
  {{:http://wiki.libsdl.org/moin.fcg/CategoryVideo}Video category} *)

type context

external create_context : win:Sdlwindow.t -> context
  = "caml_SDL_GL_CreateContext"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_CreateContext}api doc} *)

external make_current :
  win:Sdlwindow.t -> ctx:context -> int
  = "caml_SDL_GL_MakeCurrent"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_MakeCurrent}api doc} *)

external unload_library : unit -> unit
  = "caml_SDL_GL_UnloadLibrary"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_UnloadLibrary}api doc} *)

external extension_supported : extension:string -> bool
  = "caml_SDL_GL_ExtensionSupported"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_ExtensionSupported}api doc} *)

(* TODO: return something more semantic than an int *)
external get_swap_interval : unit -> int
  = "caml_SDL_GL_GetSwapInterval"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_GetSwapInterval}api doc} *)

external swap_window : Sdlwindow.t -> unit
  = "caml_SDL_GL_SwapWindow"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_SwapWindow}api doc} *)

external delete_context : context -> unit
  = "caml_SDL_GL_DeleteContext"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_DeleteContext}api doc} *)
