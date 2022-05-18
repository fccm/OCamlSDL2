(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2022 Carsten Elton Sørensen
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Texture access kind *)

type t =
| Static
| Streaming
| Target


let to_string = function
  | Static    -> "SDL_TEXTUREACCESS_STATIC"
  | Streaming -> "SDL_TEXTUREACCESS_STREAMING"
  | Target    -> "SDL_TEXTUREACCESS_TARGET"


let of_string s =
  match String.uppercase_ascii s with
  | "SDL_TEXTUREACCESS_STATIC"    -> Static
  | "SDL_TEXTUREACCESS_STREAMING" -> Streaming
  | "SDL_TEXTUREACCESS_TARGET"    -> Target
  | _ -> invalid_arg "SdltextureAccess.of_string"

