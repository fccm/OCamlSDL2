let () =
  Random.self_init ();
  let width, height = (640, 480) in
  let r, g, b =
    (100 + Random.int 156,
     100 + Random.int 156,
     100 + Random.int 156)
  in
  let alpha = 255 in
  Sdl.init [`VIDEO];
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height ~flags:[]
  in
  Sdlrender.set_draw_color renderer r g b alpha;
  let rec aux () =
    let (x, y), buttons = Sdlmouse.get_state () in
    Sdlrender.draw_point renderer ~x ~y;
    Sdlrender.render_present renderer;
    Printf.printf ".%!";
    List.iter print_endline (
      List.map Sdlmouse.to_string buttons);
    Sdltimer.delay 10;
    match Sdlevent.poll_event () with
    | Some Sdlevent.Quit _ -> Sdl.quit ()
    | _ -> aux ()
  in
  aux ()
