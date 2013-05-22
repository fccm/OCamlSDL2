(** Joystick Hat *)

type positions = {
  left: bool;
  right: bool;
  up: bool;
  down: bool;
}

val string_of_pos : positions -> string

type direction =
  | Centered
  | Up
  | Right
  | Down
  | Left
  | Right_Up
  | Right_Down
  | Left_Up
  | Left_Down

val string_of_dir : direction -> string
val dir_of_string : string -> direction
