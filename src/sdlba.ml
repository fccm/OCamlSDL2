(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2014 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Prefixless modules, with Bigarray interactions *)

module Surface_ba = struct
  include Sdlsurface_ba
end

