open Sdl
open Sdlgl

let main () =
  Sdlinit.init [`VIDEO];

  Sdlgl.set_attribute GL_RED_SIZE 8;
  Sdlgl.set_attribute GL_GREEN_SIZE 8;
  Sdlgl.set_attribute GL_BLUE_SIZE 8;
  Sdlgl.set_attribute GL_DEPTH_SIZE 16;
  Sdlgl.set_attribute GL_DOUBLEBUFFER 1;

  let window =
    Sdlwindow.create
      ~title:"OpenGL Window"
      ~x:10
      ~y:10
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
;;

let () =
  try main ()
  with e ->
    prerr_endline (Sdlerror.get_error ());
    raise e

