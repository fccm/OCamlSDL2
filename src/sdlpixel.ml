(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Pixel format *)

type pixel_format_t =
  | PixelFormat_Unknown
  | PixelFormat_Index1LSB
  | PixelFormat_Index1MSB
  | PixelFormat_Index4LSB
  | PixelFormat_Index4MSB
  | PixelFormat_Index8
  | PixelFormat_RGB332
  | PixelFormat_RGB444
  | PixelFormat_RGB555
  | PixelFormat_BGR555
  | PixelFormat_ARGB4444
  | PixelFormat_RGBA4444
  | PixelFormat_ABGR4444
  | PixelFormat_BGRA4444
  | PixelFormat_ARGB1555
  | PixelFormat_RGBA5551
  | PixelFormat_ABGR1555
  | PixelFormat_BGRA5551
  | PixelFormat_RGB565
  | PixelFormat_BGR565
  | PixelFormat_RGB24
  | PixelFormat_BGR24
  | PixelFormat_RGB888
  | PixelFormat_RGBX8888
  | PixelFormat_BGR888
  | PixelFormat_BGRX8888
  | PixelFormat_ARGB8888
  | PixelFormat_RGBA8888
  | PixelFormat_ABGR8888
  | PixelFormat_BGRA8888
  | PixelFormat_ARGB2101010
  | PixelFormat_YV12
  | PixelFormat_IYUV
  | PixelFormat_YUY2
  | PixelFormat_UYVY
  | PixelFormat_YVYU

external get_pixel_format_name : pixel_format_t -> string
  = "caml_SDL_GetPixelFormatName"

type pixel_format

external alloc_format : pixel_format_t -> pixel_format
  = "caml_SDL_AllocFormat"

external free_format : pixel_format -> unit
  = "caml_SDL_FreeFormat"

type uint8 = int

type rgb = uint8 * uint8 * uint8
type rgba = uint8 * uint8 * uint8 * uint8

external map_RGB :
  pixel_format -> rgb:rgb -> int32
  = "caml_SDL_MapRGB"

external map_RGBA :
  pixel_format -> rgba:rgba -> int32
  = "caml_SDL_MapRGBA"

external get_RGB : pixel:int32 -> fmt:pixel_format -> rgb
  = "caml_SDL_GetRGB"

external get_RGBA : pixel:int32 -> fmt:pixel_format -> rgba
  = "caml_SDL_GetRGBA"
