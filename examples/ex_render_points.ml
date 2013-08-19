let () =
  Random.self_init ();
  Sdl.init [`VIDEO];
  let width, height = (320, 240) in
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height ~flags:[]
  in

  let rec loop () =
    let r = Random.int 255 in
    let g = Random.int 255 in
    let b = Random.int 255 in
    Sdlrender.set_draw_color3 renderer r g b 255;
    let x = Random.int 320 in
    let y = Random.int 240 in
    Sdlrender.draw_point2 renderer ~x ~y;
    let x = Random.int 320 in
    let y = Random.int 240 in
    Sdlrender.set_draw_color3 renderer 0 0 0 255;
    Sdlrender.draw_point2 renderer ~x ~y;
    Sdlrender.render_present renderer;
    match Sdlevent.poll_event () with
    | Some Sdlevent.Quit _ -> Sdl.quit ()
    | _ -> loop ()
  in
  loop ()
