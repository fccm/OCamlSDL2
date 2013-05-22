let print_version label (major, minor, patch) =
  Printf.printf "%s: (%d, %d, %d)\n" label major minor patch

let () =
  let runtime_version = Sdlversion.get_runtime_version () in
  let compiled_version = Sdlversion.get_compiled_version () in
  print_version "runtime version " runtime_version;
  print_version "compiled version" compiled_version;
  Printf.printf "revision: %d, %s\n"
    (Sdlversion.get_revision_number ())
    (Sdlversion.get_revision_string ())
