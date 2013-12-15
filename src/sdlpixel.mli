(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Pixel format *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryPixels}Pixels category} *)

external get_pixel_format_name : SdlpixelFormat.t -> string
  = "caml_SDL_GetPixelFormatName"
(** {{:http://wiki.libsdl.org/SDL_GetPixelFormatName}api doc} *)

type pixel_format

external alloc_format : SdlpixelFormat.t -> pixel_format
  = "caml_SDL_AllocFormat"
(** {{:http://wiki.libsdl.org/SDL_AllocFormat}api doc} *)

external free_format : pixel_format -> unit
  = "caml_SDL_FreeFormat"
(** {{:http://wiki.libsdl.org/SDL_FreeFormat}api doc} *)

type uint8 = int

type rgb = uint8 * uint8 * uint8
type rgba = uint8 * uint8 * uint8 * uint8

external map_RGB :
  pixel_format -> rgb:rgb -> int32
  = "caml_SDL_MapRGB"
(** {{:http://wiki.libsdl.org/SDL_MapRGB}api doc} *)

external map_RGBA :
  pixel_format -> rgba:rgba -> int32
  = "caml_SDL_MapRGBA"
(** {{:http://wiki.libsdl.org/SDL_MapRGBA}api doc} *)

external get_RGB : pixel:int32 -> fmt:pixel_format -> rgb
  = "caml_SDL_GetRGB"
(** {{:http://wiki.libsdl.org/SDL_GetRGB}api doc} *)

external get_RGBA : pixel:int32 -> fmt:pixel_format -> rgba
  = "caml_SDL_GetRGBA"
(** {{:http://wiki.libsdl.org/SDL_GetRGBA}api doc} *)

