(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Events handling *)

type state =
  | Released
  | Pressed

let string_of_state = function
  | Released -> "Released"
  | Pressed  -> "Pressed"

type keyboard_event = {
  ke_timestamp: int32;
  ke_window_id: int32;
  ke_state: state;
  ke_repeat: int;
  scancode: Sdlscancode.t;
  keycode: Sdlkeycode.t;
  keymod: Sdlkeymod.t list;
}

type mouse_motion_event = {
  mm_timestamp: int32;
  mm_window_id: int32;
  mm_buttons: int list;
  mm_x: int;
  mm_y: int;
  mm_xrel: int;
  mm_yrel: int;
}

type mouse_button_event = {
  mb_timestamp: int32;
  mb_window_id: int32;
  mb_button: int;
  mb_state: state;
  mb_x: int;
  mb_y: int;
}

type mouse_wheel_event = {
  mw_timestamp: int32;
  mw_window_id: int32;
  mw_x: int;
  mw_y: int;
}

type joy_axis_event = {
  ja_timestamp: int32;
  ja_which: int;
  ja_axis: int;
  ja_value: int;
}

type joy_button_event = {
  jb_timestamp: int32;
  jb_which: int;
  jb_button: int;
  jb_state: state;
}

type joy_hat_event = {
  jh_timestamp: int32;
  jh_which: int;
  jh_hat: int;
  jh_dir: Sdlhat.direction;
  jh_pos: Sdlhat.positions;
}

type joy_device_change =
  | JoyDevice_Added
  | JoyDevice_Removed

let string_of_joy_device_change = function
  | JoyDevice_Added   -> "JoyDevice_Added"
  | JoyDevice_Removed -> "JoyDevice_Removed"

type joy_device_event = {
  jd_timestamp: int32;
  jd_which: int;
  jd_change: joy_device_change;
}

type window_event_xy = {
  win_x: int;
  win_y: int;
}

type window_event_kind =
  | WindowEvent_Shown
  | WindowEvent_Hidden
  | WindowEvent_Exposed
  | WindowEvent_Moved of window_event_xy
  | WindowEvent_Resized of window_event_xy
  | WindowEvent_Size_Changed of window_event_xy
  | WindowEvent_Minimized
  | WindowEvent_Maximized
  | WindowEvent_Restored
  | WindowEvent_Enter
  | WindowEvent_Leave
  | WindowEvent_Focus_Gained
  | WindowEvent_Focus_Lost
  | WindowEvent_Close

let string_of_window_event_kind = function
  | WindowEvent_Shown         -> "WindowEvent_Shown"
  | WindowEvent_Hidden        -> "WindowEvent_Hidden"
  | WindowEvent_Exposed       -> "WindowEvent_Exposed"
  | WindowEvent_Minimized     -> "WindowEvent_Minimized"
  | WindowEvent_Maximized     -> "WindowEvent_Maximized"
  | WindowEvent_Restored      -> "WindowEvent_Restored"
  | WindowEvent_Enter         -> "WindowEvent_Enter"
  | WindowEvent_Leave         -> "WindowEvent_Leave"
  | WindowEvent_Focus_Gained  -> "WindowEvent_Focus_Gained"
  | WindowEvent_Focus_Lost    -> "WindowEvent_Focus_Lost"
  | WindowEvent_Close         -> "WindowEvent_Close"
  | WindowEvent_Moved p ->
      Printf.sprintf "WindowEvent_Moved(%d, %d)" p.win_x p.win_y
  | WindowEvent_Resized p ->
      Printf.sprintf "WindowEvent_Resized(%d, %d)" p.win_x p.win_y
  | WindowEvent_Size_Changed p->
      Printf.sprintf "WindowEvent_Size_Changed(%d, %d)" p.win_x p.win_y

type window_event = {
  we_timestamp: int32;
  window_ID: int32;
  kind : window_event_kind;
}

type quit_event = {
  quit_timestamp: int32;
}

type text_editing_event = {
  te_timestamp: int32;
  te_window_ID: int32;
  te_text: string;
  te_begin: int;
  te_length: int;
}

type text_input_event = {
  ti_timestamp: int32;
  ti_window_ID: int32;
  ti_text: string;
}

type t =
  | Quit of quit_event
  | Mouse_Motion of mouse_motion_event
  | Mouse_Button_Down of mouse_button_event
  | Mouse_Button_Up of mouse_button_event
  | Mouse_Wheel of mouse_wheel_event
  | KeyDown of keyboard_event
  | KeyUp of keyboard_event
  | Text_Editing of text_editing_event
  | Text_Input of text_input_event
  | Joy_Axis_Motion of joy_axis_event
  | Joy_Ball_Motion
  | Joy_Hat_Motion of joy_hat_event
  | Joy_Button_Down of joy_button_event
  | Joy_Button_Up of joy_button_event
  | Joy_Device_Added of joy_device_event
  | Joy_Device_Removed of joy_device_event
  | Controller_Axis_Motion
  | Controller_Button_Down
  | Controller_Button_Up
  | Controller_Device_Added
  | Controller_Device_Removed
  | Finger_Down
  | Finger_Up
  | Finger_Motion
  | Dollar_Gesture
  | Dollar_Record
  | Multi_Gesture
  | Clipboard_Update
  | Drop_File
  | User_Event
  | Window_Event of window_event
  | SysWM_Event


external poll_event : unit -> t option
  = "caml_SDL_PollEvent"

let to_string = function
  | Mouse_Motion _            -> "Mouse_Motion"
  | Mouse_Button_Down _       -> "Mouse_Button_Down"
  | Mouse_Button_Up _         -> "Mouse_Button_Up"
  | Mouse_Wheel _             -> "Mouse_Wheel"
  | KeyDown _                 -> "KeyDown"
  | KeyUp _                   -> "KeyUp"
  | Text_Editing _            -> "Text_Editing"
  | Text_Input _              -> "Text_Input"
  | Joy_Axis_Motion _         -> "Joy_Axis_Motion"
  | Joy_Ball_Motion           -> "Joy_Ball_Motion"
  | Joy_Hat_Motion _          -> "Joy_Hat_Motion"
  | Joy_Button_Down _         -> "Joy_Button_Down"
  | Joy_Button_Up _           -> "Joy_Button_Up"
  | Joy_Device_Added _        -> "Joy_Device_Added"
  | Joy_Device_Removed _      -> "Joy_Device_Removed"
  | Controller_Axis_Motion    -> "Controller_Axis_Motion"
  | Controller_Button_Down    -> "Controller_Button_Down"
  | Controller_Button_Up      -> "Controller_Button_Up"
  | Controller_Device_Added   -> "Controller_Device_Added"
  | Controller_Device_Removed -> "Controller_Device_Removed"
  | Finger_Down               -> "Finger_Down"
  | Finger_Up                 -> "Finger_Up"
  | Finger_Motion             -> "Finger_Motion"
  | Dollar_Gesture            -> "Dollar_Gesture"
  | Dollar_Record             -> "Dollar_Record"
  | Multi_Gesture             -> "Multi_Gesture"
  | Clipboard_Update          -> "Clipboard_Update"
  | Drop_File                 -> "Drop_File"
  | User_Event                -> "User_Event"
  | Window_Event _            -> "Window_Event"
  | SysWM_Event               -> "SysWM_Event"
  | Quit _                    -> "Quit"
