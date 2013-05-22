type positions = {
  left: bool;
  right: bool;
  up: bool;
  down: bool;
}

let string_of_pos p =
  let lst = [] in
  let lst = if p.down  then "Down"::lst else lst in
  let lst = if p.up    then "Up"::lst else lst in
  let lst = if p.right then "Right"::lst else lst in
  let lst = if p.left  then "Left"::lst else lst in
  (String.concat " " lst)

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

let string_of_dir = function
  | Centered    -> "Centered"
  | Up          -> "Up"
  | Right       -> "Right"
  | Down        -> "Down"
  | Left        -> "Left"
  | Right_Up    -> "Right_Up"
  | Right_Down  -> "Right_Down"
  | Left_Up     -> "Left_Up"
  | Left_Down   -> "Left_Down"

let dir_of_string s =
  match String.lowercase s with
  | "centered"      -> Centered
  | "up"            -> Up
  | "right"         -> Right
  | "down"          -> Down
  | "left"          -> Left
  | "right_up"      -> Right_Up
  | "right_down"    -> Right_Down
  | "left_up"       -> Left_Up
  | "left_down"     -> Left_Down
  | _ -> invalid_arg "of_string"
