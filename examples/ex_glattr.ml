open Sdl
open Sdlgl

let main () =
  Sdlinit.init [`VIDEO];

  Sdlgl.set_attribute GL_RED_SIZE 5;
  Sdlgl.set_attribute GL_GREEN_SIZE 6;
  Sdlgl.set_attribute GL_BLUE_SIZE 5;
  Sdlgl.set_attribute GL_DEPTH_SIZE 16;
  Sdlgl.set_attribute GL_DOUBLEBUFFER 1;

  let window =
    Sdlwindow.create2
      ~title:"OpenGL Window"
      ~x:(`pos 10)
      ~y:(`pos 10)
      ~width:640
      ~height:480
      ~flags:[Sdlwindow.OpenGL]
  in

  let context = Sdlgl.create_context window in
  ignore(context);

  Printf.printf
    "Red size: %d, Green size: %d, Blue size: %d\n%!"
    (Sdlgl.get_attribute GL_RED_SIZE)
    (Sdlgl.get_attribute GL_GREEN_SIZE)
    (Sdlgl.get_attribute GL_BLUE_SIZE);

  Sdltimer.delay 2000;
  Sdl.quit ()
;;

let () =
  try main ()
  with e ->
    prerr_endline (Sdlerror.get_error ());
    raise e

