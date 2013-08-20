let () =
  Sdl.init [`VIDEO];
  let width, height = (320, 240) in
  let _ =
    Sdlwindow.create2
      ~title:"Let's try SDL2 with OCaml!"
      ~x:`undefined ~y:`undefined ~width ~height
      ~flags:[]
  in
  Sdltimer.delay 2000;
  Sdl.quit ()
