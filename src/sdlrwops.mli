(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Read / Write operations *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryIO}IO category} *)

type t

external from_mem : string -> t
  = "caml_SDL_RWFromMem"

external from_file : filename:string -> mode:string -> t
  = "caml_SDL_RWFromFile"

type input = [
  | `Filename of string   (** provide the input by its filename *)
  | `Buffer of string     (** provide the input data as a buffer *)
  ]

val from_input :
  [< `Buffer of string | `Filename of string ] -> t

val from_input_opt :
  [> `Buffer of string | `Filename of string ] -> t option

external alloc : unit -> t = "caml_SDL_AllocRW"
external free : t -> unit = "caml_SDL_FreeRW"


type uint8 = int

type uint16 = int
type uint32 = int
type uint64 = int

external readU8 : t -> uint16 = "caml_SDL_ReadU8"
external writeU8 : t -> uint16 -> int = "caml_SDL_WriteU8"

module BigEndian : sig
  external read16 : t -> uint16 = "caml_SDL_ReadBE16"
  external read32 : t -> uint16 = "caml_SDL_ReadBE32"
  external read64 : t -> uint16 = "caml_SDL_ReadBE64"
  external write16 : t -> uint16 -> int = "caml_SDL_WriteBE16"
  external write32 : t -> uint16 -> int = "caml_SDL_WriteBE32"
  external write64 : t -> uint16 -> int = "caml_SDL_WriteBE64"
end

module LittleEndian : sig
  external read16 : t -> uint16 = "caml_SDL_ReadLE16"
  external read32 : t -> uint16 = "caml_SDL_ReadLE32"
  external read64 : t -> uint16 = "caml_SDL_ReadLE64"
  external write16 : t -> uint16 -> int = "caml_SDL_WriteLE16"
  external write32 : t -> uint16 -> int = "caml_SDL_WriteLE32"
  external write64 : t -> uint16 -> int = "caml_SDL_WriteLE64"
end

