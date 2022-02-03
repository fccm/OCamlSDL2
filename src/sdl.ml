(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Prefixless modules *)

include Sdlinit
include Sdlquit

external get_platform : unit -> string
  = "caml_SDL_GetPlatform"

module Init = struct
  include Sdlinit
end
module Quit = struct
  include Sdlquit
end
module Window = struct
  include Sdlwindow
end
module Surface = struct
  include Sdlsurface
end
module Render = struct
  include Sdlrender
end
module Texture = struct
  include Sdltexture
end
module PixelFormat = struct
  include SdlpixelFormat
end
module Pixel = struct
  include Sdlpixel
end
module BlendMode = struct
  include SdlblendMode
end
module Event = struct
  include Sdlevent
end
module Keyboard = struct
  include Sdlkeyboard
end
module Keycode = struct
  include Sdlkeycode
end
module Scancode = struct
  include Sdlscancode
end
module Keymod = struct
  include Sdlkeymod
end
module Mouse = struct
  include Sdlmouse
end
module Joystick = struct
  include Sdljoystick
end
module Hat = struct
  include Sdlhat
end
module Rect = struct
  include Sdlrect
end
module Timer = struct
  include Sdltimer
end
module Clipboard = struct
  include Sdlclipboard
end
module GL = struct
  include Sdlgl
end
module Audio = struct
  include Sdlaudio
end
module Filesystem = struct
  include Sdlfilesystem
end
module Version = struct
  include Sdlversion
end
module CPUInfo = struct
  include Sdlcpuinfo
end
module Power = struct
  include Sdlpower
end
module RWops = struct
  include Sdlrwops
end
module Error = struct
  include Sdlerror
end
module Hint = struct
  include Sdlhint
end
  
