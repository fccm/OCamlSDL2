open Sdl

let () =
  let drivers = Audio.get_drivers () in
  Array.iteri (fun i driver ->
    Printf.printf "driver[%d]: %S\n" i driver;
  ) drivers;
  Audio.init ~driver_name:drivers.(0);
  Printf.printf "current_driver: %S\n"
    (Audio.get_current_driver ());
  Audio.quit ()
