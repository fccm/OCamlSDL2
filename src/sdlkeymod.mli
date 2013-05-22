(** Key mods *)

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

val to_string : t -> string
val of_string : string -> t
