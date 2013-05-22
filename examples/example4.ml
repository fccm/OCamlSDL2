let () =
  let width, height = (640, 480) in
  Random.self_init ();
  Sdl.init [`VIDEO];
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height
  in
  for i = 1 to 32 do
    let r, g, b =
      (Random.int 256,
       Random.int 256,
       Random.int 256)
    in
    let alpha = 255 in
    Sdlrender.set_draw_color renderer r g b alpha;
    for i = 1 to 640 * 480 / 32 do
      let x = Random.int 640
      and y = Random.int 480 in
      Sdlrender.draw_point renderer ~x ~y;
    done;
    Sdlrender.render_present renderer;
    Sdltimer.delay 40;
  done;
  Sdlwindow.hide window;
  Sdltimer.delay 1000;
  Sdlwindow.show window;
  Sdlrender.render_present renderer;
  Sdltimer.delay 2000;
  Sdl.quit ()
