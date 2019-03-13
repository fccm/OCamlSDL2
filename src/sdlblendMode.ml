(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Blend Modes *)

type t =
  | BNone
  | Blend
  | Add
  | Mod

let to_string = function
  | BNone   -> "blend_mode_none"
  | Blend   -> "blend_mode_blend"
  | Add     -> "blend_mode_add"
  | Mod     -> "blend_mode_mod"

let of_string s =
  match String.lowercase_ascii s with
  | "blend_mode_none"   -> BNone
  | "blend_mode_blend"  -> Blend
  | "blend_mode_add"    -> Add
  | "blend_mode_mod"    -> Mod
  | _ -> invalid_arg "SdlblendMode.of_string"

