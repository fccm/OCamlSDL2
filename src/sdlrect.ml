(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Rectangles *)

(** A rectangle, with the origin at the upper left. *)
type t = {
  x: int;
  y: int;
  w: int;
  h: int;
}

let make ~pos:(x, y) ~dims:(w, h) =
  { x; y; w; h }

let make4 ~x ~y ~w ~h =
  { x; y; w; h }

external has_intersection : a:t -> b:t -> bool
  = "caml_SDL_HasIntersection"

