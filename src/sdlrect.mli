(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Rectangles *)

(** {{:http://wiki.libsdl.org/CategoryRect}Rect category} *)

(** A rectangle, with the origin at the upper left. *)
type t = {
  x: int;
  y: int;
  w: int;
  h: int;
}

val make : pos:int * int -> dims:int * int -> t
(** currently an alias for [make2] *)

val make1 : int * int * int * int -> t

val make2 : pos:int * int -> dims:int * int -> t

val make4 : x:int -> y:int -> w:int -> h:int -> t

val move : t -> x:int -> y:int -> t

external has_intersection : a:t -> b:t -> bool
  = "caml_SDL_HasIntersection"

external intersect_rect_and_line : rect:t -> p1:int * int -> p2:int * int ->
  (int * int * int * int) option
  = "caml_SDL_IntersectRectAndLine"

external point_in_rect : p:int * int -> r:t -> bool
  = "caml_SDL_PointInRect"

