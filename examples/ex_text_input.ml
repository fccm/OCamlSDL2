(* This example requires a terminal with a UTF-8 locale *)

let () =
  let width, height = (200, 200) in
  Sdl.init [`VIDEO];
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height ~flags:[]
  in
  Sdlrender.set_draw_color renderer (0,0,0) 255;
  Sdlrender.clear renderer;
  let text = ref "" in
  (* This is required in order to tell SDL to generate
     the Text_Input and Text_Editing events *)
  Sdlkeyboard.start_text_input ();
  let rec aux () =
    let open Sdlevent in
    match poll_event () with
    | Some Quit _ -> Sdl.quit ()
    | Some Text_Input ti ->
      (* Add the text to the already edited text *)
      text := !text ^ ti.ti_text;
      Printf.printf "text: %s\n%!" !text;
      aux ()
    | Some Text_Editing te ->
      (* Update the composition. To correctly place the
         cursor and the selection, we need something like
         Camomile to correctly split the UTF-8 string. As I
         do not want to depend on that for this example, we
         will simply print the values. *)
      Printf.printf
        "text: %s editing: %s cursor: %d selection length: %d\n"
        !text
        te.te_text
        te.te_begin
        te.te_length;
      aux ()
    | _ -> aux ()
  in
  aux ()
