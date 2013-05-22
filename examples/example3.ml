open Sdl

let f surf win x y w h ~color ~msec =
  let rect = Rect.make x y w h in
  Surface.fill_rect ~dst:surf ~rect ~color;
  Window.update_surface win;
  Timer.delay msec;
;;

let () =
  Sdl.init [`VIDEO];
  let win =
    Window.create
      ~title:"Hello OCaml SDL2"
      ~x:10 ~y:40 ~width:640 ~height:480
      ~flags:[Sdlwindow.Resizable]
  in
  let surf = Window.get_surface win in
  f surf win 20 20 200 120 ~color:0x00FF00l ~msec:600;
  f surf win 60 60 200 200 ~color:0xFF0000l ~msec:600;
  f surf win  0  0 100 100 ~color:0x0000FFl ~msec:2000;
  (*
  Sdlsurface.save_bmp surf ~filename:"test.bmp";
  *)
  Sdl.quit ()
