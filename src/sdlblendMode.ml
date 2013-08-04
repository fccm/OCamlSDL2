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
  | None
  | Blend
  | Add
  | Mod

let to_string = function
  | None    -> "Blend_Mode_None"
  | Blend   -> "Blend_Mode_Blend"
  | Add     -> "Blend_Mode_Add"
  | Mod     -> "Blend_Mode_Mod"

let of_string s =
  match String.lowercase s with
  | "blend_mode_none"   -> None
  | "blend_mode_blend"  -> Blend
  | "blend_mode_add"    -> Add
  | "blend_mode_mod"    -> Mod
  | _ -> invalid_arg "SdlblendMode.of_string"

