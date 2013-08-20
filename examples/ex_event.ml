open Sdlevent
open Sdl

let print_keyboard_event e st =
  Printf.printf "
keyboard_event ((
  timestamp: %ld
  window_id: %lX
  state: %s / %s
  repeat: %d
  scancode: %s
  keycode: %s
  keymod: %s
))\n%!"
  e.ke_timestamp
  e.ke_window_id
  (Sdlevent.string_of_state e.ke_state) st
  e.ke_repeat
  (Sdlscancode.to_string e.scancode)
  (Sdlkeycode.to_string e.keycode)
  (String.concat " "
    (List.map Sdlkeymod.to_string e.keymod))

let print_mouse_motion_event e =
  Printf.printf "
mouse_motion_event ((
  timestamp: %ld
  window_id: %lX
  buttons: %s
  x: %d
  y: %d
  xrel: %d
  yrel: %d
))\n%!"
  e.mm_timestamp
  e.mm_window_id
  (String.concat " "
    (List.map string_of_int e.mm_buttons))
  e.mm_x
  e.mm_y
  e.mm_xrel
  e.mm_yrel

let print_mouse_button_event e s =
  Printf.printf "
mouse_button_event ((
  timestamp: %ld
  window_id: %lX
  button: %d
  state: %s %s
  x: %d
  y: %d
))\n%!"
  e.mb_timestamp
  e.mb_window_id
  e.mb_button
  (Sdlevent.string_of_state e.mb_state) s
  e.mb_x
  e.mb_y

let print_mouse_wheel_event e =
  Printf.printf "
mouse_wheel_event ((
  timestamp: %ld
  window_id: %lX
  x: %d
  y: %d
))\n%!"
  e.mw_timestamp
  e.mw_window_id
  e.mw_x
  e.mw_y

let print_joy_axis_event e =
  Printf.printf "
joy_axis_event ((
  timestamp: %ld
  which: %d
  axis: %d
  value: %d
))\n%!"
  e.ja_timestamp
  e.ja_which
  e.ja_axis
  e.ja_value

let print_joy_button_event e s =
  Printf.printf "
joy_button_event ((
  timestamp: %ld
  which: %d
  button: %d
  state: %s %s
))\n%!"
  e.jb_timestamp
  e.jb_which
  e.jb_button
  (Sdlevent.string_of_state e.jb_state) s

let print_joy_hat_event e =
  Printf.printf "
joy_hat_event ((
  timestamp: %ld
  which: %d
  hat: %d
  pos: \t left:%b \t right:%b \t up:%b \t down:%b
  #  %s
  #  %s
))\n%!"
  e.jh_timestamp
  e.jh_which
  e.jh_hat
    e.jh_pos.Hat.left
    e.jh_pos.Hat.right
    e.jh_pos.Hat.up
    e.jh_pos.Hat.down
  (Sdlhat.string_of_pos e.jh_pos)
  (Sdlhat.string_of_dir e.jh_dir)

let print_joy_device_event e ch =
  Printf.printf "
joy_device_event ((
  timestamp: %ld
  which: %d
  device_change: %s %s
))\n%!"
  e.jd_timestamp
  e.jd_which
  (Sdlevent.string_of_joy_device_change e.jd_change) ch

let print_window_event e =
  Printf.printf "
window_event ((
  timestamp: %ld
  window_ID: %ld
  kind: %s
))\n%!"
  e.we_timestamp
  e.window_ID
  (Sdlevent.string_of_window_event_kind e.kind)


let proc_events = function
  | KeyDown { scancode = Sdlscancode.ESCAPE } ->
      print_endline "Goodbye";
      exit 0
  | KeyDown { keycode = Sdlkeycode.Escape } ->
      print_endline "Fuck you!";
      exit 0
  | KeyDown e -> print_keyboard_event e "down"
  | KeyUp e -> print_keyboard_event e "up"
  | Mouse_Motion e -> print_mouse_motion_event e
  | Mouse_Button_Down e -> print_mouse_button_event e "down"
  | Mouse_Button_Up e -> print_mouse_button_event e "up"
  | Mouse_Wheel e -> print_mouse_wheel_event e
  | Joy_Axis_Motion e -> print_joy_axis_event e
  | Joy_Button_Down e -> print_joy_button_event e "down"
  | Joy_Button_Up e -> print_joy_button_event e "up"
  | Joy_Hat_Motion e -> print_joy_hat_event e
  | Joy_Device_Removed e -> print_joy_device_event e "Removed"
  | Joy_Device_Added e -> print_joy_device_event e "Added";
      ignore(Sdljoystick.j_open e.jd_which);
  | Window_Event { kind = WindowEvent_Resized p } ->
      Printf.printf "### WINDOW_RESIZED => %d x %d\n" p.win_x p.win_y
  | Window_Event e -> print_window_event e
  | Quit e ->
      Printf.printf "Quit(timestamp:%ld)\n%!" e.quit_timestamp;
      Sdl.quit ();
      exit 0
  | e ->
      print_endline (Sdlevent.to_string e)


let () =
  let width, height = (640, 480) in
  Sdl.init [`VIDEO; `JOYSTICK];
  at_exit print_newline;
  (*
  let window, renderer =
    Sdlrender.create_window_and_renderer ~width ~height
  in
  ignore (window, renderer);
  *)
  let window =
    Sdlwindow.create2
      ~title:"SDL Event"
      ~x:`undefined ~y:`undefined
      ~width ~height
      ~flags:[
      (*
      Sdlwindow.FullScreen;
      Sdlwindow.OpenGL;
      Sdlwindow.Shown;
      Sdlwindow.Hidden;
      Sdlwindow.Borderless;
      Sdlwindow.Resizable;
      Sdlwindow.Minimized;
      Sdlwindow.Maximized;
      Sdlwindow.Input_Grabbed;
      Sdlwindow.Input_Focus;
      Sdlwindow.Mouse_Focus;
      Sdlwindow.FullScreen_Desktop;
      Sdlwindow.Foreign;
      *)
    ]
  in
  ignore (window);

  let joy_num = Sdljoystick.num_joysticks () in
  for i = 0 to pred joy_num do
    ignore(Sdljoystick.j_open i);
    let name = Sdljoystick.name_for_index i in
    Printf.printf "Joy-name: %s\n" name;
  done;

  let rec event_loop () =
    match Sdlevent.poll_event () with
    | Some ev -> proc_events ev; event_loop ()
    | None -> ()
  in
  let rec main_loop () =
    event_loop ();
    Printf.printf ".%!";
    Sdltimer.delay 20;
    main_loop ()
  in
  main_loop ()
