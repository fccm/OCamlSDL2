let () =
  Sdl.init [`VIDEO];
  let width, height = (320, 240) in
  let _ =
    Sdlwindow.create
      ~title:"Let's try SDL2 with OCaml!"
      ~x:10 ~y:40 ~width ~height
      ~flags:[]
  in
  Sdltimer.delay 2000;
  Sdl.quit ()
