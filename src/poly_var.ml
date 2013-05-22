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

external hash_var : string -> int
  = "my_caml_hash_variant"

let pad s n =
  let len = String.length s in
  let p = max 0 (n - len) in
  s ^ (String.make p ' ')

let read_lines lines =
  let pat = Str.regexp "[\t]+" in
  let lst =
    List.fold_left (fun acc line ->
      match Str.split pat line with
      | [a; b] -> (a, b)::acc
      | lst ->
          List.iter (Printf.eprintf " / %s") lst;
          Printf.eprintf "\n======\n";
          (acc)
    ) [] lines
  in
  (List.rev lst)

let prepare_vars vars =
  let n1, n2 =
    List.fold_left (fun (n1, n2) (c_val, poly_var) ->
      let s1 = String.length c_val
      and s2 = String.length poly_var in
      (max n1 s1, max n2 s2)
    ) (0, 0) vars
  in
  List.map (fun (c_val, poly_var) ->
    (c_val, pad c_val n1,
     poly_var, pad poly_var n2,
     hash_var poly_var)
  ) vars

let parse_cmd argv =
  match List.tl (Array.to_list argv) with
  | ["-c"; filename] -> (`C, filename)
  | ["-ml"; filename] -> (`ML, filename)
  | ["-table"; filename] -> (`Table, filename)
  | _ -> assert false

let print_ml =
  List.iter (fun (_, _, poly_var, _, _) ->
    Printf.printf "  | `%s\n" poly_var)

let print_c =
  List.iter (fun (c_val, p_c_val, poly_var, p_poly_var, h) ->
    Printf.printf "#define MLVAR_%s 0x%08X\n" p_poly_var h)

let print_table =
  List.iter (fun (c_val, p_c_val, poly_var, p_poly_var, _) ->
    Printf.printf "    MLVAR_%s,\t%s,\n" poly_var c_val)

let () =
  let out_kind, in_file = parse_cmd Sys.argv in
  let lines = load_lines in_file in
  let vars = read_lines lines in
  let vars = prepare_vars vars in
  match out_kind with
  | `C -> print_c vars
  | `ML -> print_ml vars
  | `Table -> print_table vars
