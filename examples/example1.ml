let () =
  (*
  Sdl.init [`EVERYTHING];
  let surf = Sdlvideo.set_video_mode ~w:320 ~h:240 ~bpp:32 [`HWSURFACE] in
  *)
  (*
  let width, height = (320, 240) in
  let title = "Hello OCamlSDL2" in
  let window =
    Sdlwindow.create ~title ~x:10 ~y:40 ~width ~height
      ~flags:[Sdlwindow.Resizable]
  in
  let surf = Sdlwindow.get_surface window in
  *)
  Random.self_init ();
  Sdl.init [`VIDEO];
  let width, height = (320, 240) in
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height
  in

  let rec loop () =
    let r = Random.int 255 in
    let g = Random.int 255 in
    let b = Random.int 255 in
    Sdlrender.set_draw_color renderer r g b 255;
    let x = Random.int 320 in
    let y = Random.int 240 in
    Sdlrender.draw_point renderer ~x ~y;
    let x = Random.int 320 in
    let y = Random.int 240 in
    Sdlrender.set_draw_color renderer 0 0 0 255;
    Sdlrender.draw_point renderer ~x ~y;
    Sdlrender.render_present renderer;
    match Sdlevent.poll_event () with
    | Some Sdlevent.Quit _ -> Sdl.quit ()
    | _ -> loop ()
  in
  loop ()
