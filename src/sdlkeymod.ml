type t =
  | LShift
  | RShift
  | LCtrl
  | RCtrl
  | LAlt
  | RAlt
  | LGUI
  | RGUI
  | NUM
  | CAPS
  | MODE

let to_string = function
  | LShift -> "LShift"
  | RShift -> "RShift"
  | LCtrl  -> "LCtrl"
  | RCtrl  -> "RCtrl"
  | LAlt   -> "LAlt"
  | RAlt   -> "RAlt"
  | LGUI   -> "LGUI"
  | RGUI   -> "RGUI"
  | NUM    -> "NUM"
  | CAPS   -> "CAPS"
  | MODE   -> "MODE"

let of_string s =
  match String.lowercase_ascii s with
  | "lshift" -> LShift
  | "rshift" -> RShift
  | "lctrl"  -> LCtrl
  | "rctrl"  -> RCtrl
  | "lalt"   -> LAlt
  | "ralt"   -> RAlt
  | "lgui"   -> LGUI
  | "rgui"   -> RGUI
  | "num"    -> NUM
  | "caps"   -> CAPS
  | "mode"   -> MODE
  | _ -> invalid_arg "Sdlkeymod.of_string"

