open Sdl

let () =
  let n = CPUInfo.get_CPU_count () in
  Printf.printf "CPU count: %d\n" n
