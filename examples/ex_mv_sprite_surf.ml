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


let () =
  let width, height = (640, 480) in
  Sdl.init [`VIDEO; `JOYSTICK];
  at_exit print_newline;
  let window =
    Window.create
      ~x:0 ~y:0 ~width ~height
      ~title:"SDL Event" ~flags:[Window.Resizable]
  in
  let screen = Window.get_surface window in
  let filename = "assets/circle64.bmp" in
  let surf = Surface.load_bmp ~filename in

  let screen_rect = Rect.make4 0 0 width height in
  let src_rect = Rect.make4 0 0 width height in
  let dst_rect = Rect.make4 100 100 64 64 in
  let render t dt =
    Surface.fill_rect
      ~dst:screen ~rect:screen_rect
      ~color:0x000000l;
    let x = (t / 10) mod width in
    let dst_rect = { dst_rect with Rect.x } in
    let _ =
      Surface.blit_surface
        ~src:surf ~dst:screen
        ~src_rect ~dst_rect
    in
    Window.update_surface window;
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
    Timer.delay (max 0 (40 - dt));
    *)
    main_loop t
  in
  main_loop (Timer.get_ticks ())
