open Sdl
open Sdlwindow

let display () =
  GlClear.color (0.6, 0.2, 0.0);
  GlClear.clear [`color];
  GlDraw.color (1.0, 0.8, 0.0);
  GlMat.mode `projection;
  GlMat.load_identity ();
  GlMat.ortho ~x:(-1.0,1.0) ~y:(-1.0,1.0) ~z:(-1.0,1.0);
  GlDraw.begins `polygon;
  GlDraw.vertex ~x:(-0.5) ~y:(-0.5) ();
  GlDraw.vertex ~x:(-0.5) ~y:( 0.5) ();
  GlDraw.vertex ~x:( 0.5) ~y:( 0.5) ();
  GlDraw.vertex ~x:( 0.5) ~y:(-0.5) ();
  GlDraw.ends ();
  Gl.flush ()

let () =
  Sdl.init [`VIDEO];
  let width, height = (640, 480) in
  let win =
    Sdlwindow.create2
      ~title:"SDL2, OGL?"
      ~x:(`pos 10)
      ~y:(`pos 40)
      ~width ~height
      ~flags:[OpenGL; Resizable]
  in
  let rndr =
    let index = 0 in
    let flags = [Render.Accelerated] in
    Sdlrender.create_renderer ~win ~index ~flags
  in
  ignore(rndr);

  (*
  Sdlgl.extension_supported ~extension:string -> bool
  *)
  let ctx = Sdlgl.create_context ~win in
  let x = Sdlgl.make_current ~win ~ctx in
  let sw = Sdlgl.get_swap_interval () in
  Printf.printf "cur: %d\n%!" x;
  Printf.printf "swap: %d\n%!" sw;

  let driver_infos = Sdlrender.get_render_drivers () in
  Array.iter (fun driver_info ->
    Printf.printf " \
      render-name: '%s'\n \
      max_texture_width: %d\n \
      max_texture_height: %d\n\n%!"
        driver_info.Render.name
        driver_info.Render.max_texture_width
        driver_info.Render.max_texture_height
  ) driver_infos;

  (*
  Printf.printf " \
    vendor: %s\n \
    renderer: %s\n \
    version: %s\n\n%!"
      (Sdlogl.get_vendor_string ())
      (Sdlogl.get_renderer_string ())
      (Sdlogl.get_version_string ());
  *)

  for i = 1 to 4 do
    display ();
    Sdlgl.swap_window win;
    Printf.printf ".%!";
    Sdltimer.delay 600;
  done;
  Printf.printf "\n%!";
  Sdlgl.delete_context ctx;
  Sdl.quit ()
