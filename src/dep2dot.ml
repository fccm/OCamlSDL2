#load "str.cma"

let input_line ic =
  try Some (input_line ic)
  with End_of_file -> close_in ic; None

let load_lines filename =
  let ic = open_in filename in
  let rec aux acc =
    match input_line ic with
    | Some line -> aux (line::acc)
    | None -> (List.rev acc)
  in
  aux []

let ends_with s c =
  if s = "" then false else
  let n = String.length s in
  (s.[n-1] = c)

let join s1 s2 =
  let len = String.length s1 in
  (String.sub s1 0 (len-1)) ^ s2

let join_lines lines =
  let rec aux acc = function
    | line1 :: line2 :: tail
      when ends_with line1 '\\' ->
        aux ((join line1 line2) :: acc) tail
    | line :: tail ->
        aux (line :: acc) tail
    | [] ->
        (List.rev acc)
  in
  aux [] lines

let char_pos c s =
  let len = String.length s in
  let rec aux i =
    if i >= len then None else
      if s.[i] = c then Some i else
        aux (i+1)
  in
  aux 0

let char_split c s =
  match char_pos c s with
  | None -> (s, "")
  | Some p ->
      let a = String.sub s 0 p
      and b = String.sub s (p+1) (String.length s - (p+1)) in
      (a, b)

let to_list s =
  let reg = Str.regexp "[ ]+" in
  let lst = Str.split reg s in
  (List.map String.trim lst)

let chop_extension s =
  try Filename.chop_extension s
  with Invalid_argument _ -> s

let chop_extensions lst =
  List.map chop_extension lst

let uniq lst =
  let rec aux acc = function
  | [] -> (List.rev acc)
  | x::xs -> if List.mem x acc then aux acc xs else aux (x::acc) xs
  in
  aux [] lst

let list_assoc v lst =
  try Some (List.assoc v lst)
  with Not_found -> (None)

let list_assoc_all v lst =
  let rec aux acc lst =
    match list_assoc v lst with
    | Some x -> aux (x::acc) (List.remove_assoc v lst)
    | None -> (List.rev acc)
  in
  aux [] lst

let list_items lst =
  let lst = List.map (fun (a, b) -> a::b) lst in
  let lst = List.flatten lst in
  (uniq lst)

let join_deps lst =
  let items = list_items lst in
  List.map (fun item ->
    let deps = List.flatten (list_assoc_all item lst) in
    (item, uniq deps)
  ) items

let print_nodes lst =
  List.iter (fun (a, b) ->
    Printf.printf "  %s [ label = \"%s\" ]\n" a a
  ) lst

let print_deps lst =
  List.iter (fun (a, b) ->
    List.iter (fun d ->
      Printf.printf "  %s -> %s\n" a d
    ) b
  ) lst

let () =
  let lines = load_lines Sys.argv.(1) in
  let lines = join_lines lines in
  let lst = List.map (char_split ':') lines in
  let lst = List.map (fun (a, b) -> String.trim a, to_list b) lst in
  let lst = List.map (fun (a, b) -> (chop_extension a,
                                     chop_extensions b)) lst in
  let lst = List.map (fun (a, b) -> (String.capitalize a,
                            List.map String.capitalize b)) lst in
  let lst = join_deps lst in

  print_nodes lst;
  print_newline ();
  print_deps lst;
;;
