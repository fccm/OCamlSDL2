open Sdlpower

let string_power_state = function
  | `powerstate_Unknown    -> "cannot determine power status"
  | `powerstate_On_Battery -> "Not plugged in, running on the battery"
  | `powerstate_No_Battery -> "Plugged in, no battery available"
  | `powerstate_Charging   -> "Plugged in, charging battery"
  | `powerstate_Charged    -> "Plugged in, battery charged"

let () =
  let state, secs, pct = get_power_info () in
  Printf.printf "secs: %d\npct:%d\npower state: %s\n"
    secs pct
    (string_power_state state)
