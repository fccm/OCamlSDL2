let input_line ic =
  try Some (input_line ic)
  with End_of_file -> close_in ic; None

let load_lines fn =
  let ic = open_in fn in
  let rec aux acc =
    match input_line ic with
    | Some line -> aux (line::acc)
    | None -> List.rev acc
  in
  aux []

let pad s n =
  let len = String.length s in
  let p = max 0 (n - len) in
  (String.make p ' ')

let () =
  let lst = load_lines Sys.argv.(1) in
  ListLabels.iteri lst ~f:(fun i enum ->
    Printf.printf
      "    case %s:%sreturn Val_int(%d);\n"
      enum (pad enum 32) i
  )
