let () =
  let args = List.tl (Array.to_list Sys.argv) in
  let args =
    List.filter (fun arg ->
      String.length arg > 2 && arg.[0] = '-' &&
        match arg.[1] with
        | 'l' | 'L' -> true
        | _ -> false
    ) args
  in
  print_string (String.concat " " args)
