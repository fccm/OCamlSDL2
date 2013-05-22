open Sdlevent
open Sdl

let proc_events = function
  | KeyDown { keycode = Keycode.Q }
  | KeyDown { keycode = Keycode.Escape }
  | KeyDown { scancode = Scancode.ESCAPE }
  | Quit _ ->
      Sdl.quit ();
      exit 0
  | e -> ()


let load_sprite renderer ~filename =
  let surf = Surface.load_bmp ~filename in
  let tex = Texture.create_from_surface renderer surf in
  Surface.free surf;
  (tex)

let () =
  let width, height = (640, 480) in
  Sdl.init [`VIDEO; `JOYSTICK];
  at_exit print_newline;
  let window =
    Window.create
      ~x:0 ~y:0 ~width ~height
      ~title:"SDL Event" ~flags:[Window.Resizable]
  in
  let rndr =
    Render.create_renderer window (-1) 0x00l
  in

  let filename = "assets/circle64.bmp" in
  let circ = load_sprite rndr ~filename in

  let src_rect = Rect.make 0 0 64 64 in
  let dst_rect = Rect.make 100 100 64 64 in

  let render t dt =
    let x = (t / 10) mod width in
    let dst_rect = { dst_rect with Rect.x } in
    Render.clear rndr;
    Render.set_scale rndr (1.0, 1.0);
    Render.copy rndr
      ~texture:circ
      ~src_rect
      ~dst_rect;
    Render.render_present rndr;
  in

  let joy_num = Joystick.num_joysticks () in
  for i = 0 to pred joy_num do
    ignore(Joystick.j_open i)
  done;

  let rec event_loop () =
    match Event.poll_event () with
    | None -> ()
    | Some ev ->
        proc_events ev;
        event_loop ()
  in
  let rec main_loop last_t =
    event_loop ();
    let t = Timer.get_ticks () in
    let dt = t - last_t in
    render t dt;
    (*
    Timer.delay (max 0 (10 - dt));
    *)
    main_loop t
  in
  main_loop (Timer.get_ticks ())

