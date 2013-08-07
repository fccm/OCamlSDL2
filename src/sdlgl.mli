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

external set_swap_interval : interval:int -> unit
  = "caml_SDL_GL_SetSwapInterval"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_SetSwapInterval}api doc} *)

external get_swap_interval : unit -> int
  = "caml_SDL_GL_GetSwapInterval"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_GetSwapInterval}api doc} *)

external swap_window : Sdlwindow.t -> unit
  = "caml_SDL_GL_SwapWindow"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_SwapWindow}api doc} *)

external delete_context : context -> unit
  = "caml_SDL_GL_DeleteContext"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_DeleteContext}api doc} *)

(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GLattr}api doc} *)
type gl_attr =
  | GL_RED_SIZE
  | GL_GREEN_SIZE
  | GL_BLUE_SIZE
  | GL_ALPHA_SIZE
  | GL_BUFFER_SIZE
  | GL_DOUBLEBUFFER
  | GL_DEPTH_SIZE
  | GL_STENCIL_SIZE
  | GL_ACCUM_RED_SIZE
  | GL_ACCUM_GREEN_SIZE
  | GL_ACCUM_BLUE_SIZE
  | GL_ACCUM_ALPHA_SIZE
  | GL_STEREO
  | GL_MULTISAMPLEBUFFERS
  | GL_MULTISAMPLESAMPLES
  | GL_ACCELERATED_VISUAL
  | GL_RETAINED_BACKING
  | GL_CONTEXT_MAJOR_VERSION
  | GL_CONTEXT_MINOR_VERSION
  | GL_CONTEXT_EGL
  | GL_CONTEXT_FLAGS
  | GL_CONTEXT_PROFILE_MASK
  | GL_SHARE_WITH_CURRENT_CONTEXT

external set_attribute : gl_attr -> int -> unit
  = "caml_SDL_GL_SetAttribute"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_SetAttribute}api doc} *)

external get_attribute : gl_attr -> int
  = "caml_SDL_GL_GetAttribute"
(** {{:http://wiki.libsdl.org/moin.fcg/SDL_GL_GetAttribute}api doc} *)

