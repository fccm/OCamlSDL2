let () =
  let width, height = (640, 480) in
  let title = "Let's try SDL2 with OCaml!" in
  let window =
    Sdlwindow.create ~title ~x:10 ~y:40 ~width ~height
      ~flags:[Sdlwindow.Resizable]
  in
  let surf = Sdlwindow.get_surface window in
  let color = 0x00BB00_l in
  let rect = Sdlrect.make4 0 0 width height in
  Sdlsurface.fill_rect surf rect color;
  Sdlwindow.update_surface window;
  let rec aux () =
    match Sdlevent.poll_event () with
    | Some Sdlevent.Quit _ | Some Sdlevent.KeyDown _ -> ()
    | _ ->
        Sdltimer.delay 160;
        Sdlsurface.fill_rect surf rect
          (Int32.of_int (Random.int (0xFFFFFF + 1)));
        Sdlwindow.update_surface window;
        aux ()
  in
  aux ()
