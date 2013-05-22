(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* 2D rendering functions *)

type t = Sdltype.renderer

external create_window_and_renderer :
  width:int -> height:int -> Sdlwindow.t * t
  = "caml_SDL_CreateWindowAndRenderer"

external create_renderer :
  win:Sdlwindow.t -> index:int -> flags:int32 -> t
  = "caml_SDL_CreateRenderer"

external set_draw_color :
  t -> r:int -> g:int -> b:int -> a:int -> unit
  = "caml_SDL_SetRenderDrawColor"

external draw_point :
  t -> x:int -> y:int -> unit
  = "caml_SDL_RenderDrawPoint"

external copy : t -> 
  texture:Sdltexture.t ->
  src_rect:Sdlrect.t ->
  dst_rect:Sdlrect.t -> unit
  = "caml_SDL_RenderCopy"

external set_scale : t -> float * float -> unit
  = "caml_SDL_RenderSetScale"

external render_present : t -> unit
  = "caml_SDL_RenderPresent"

external clear : t -> unit
  = "caml_SDL_RenderClear"

type renderer_info = {
  name: string;
  max_texture_width: int;
  max_texture_height: int;
}

external get_render_drivers : unit -> renderer_info array
  = "caml_SDL_GetRenderDrivers"
