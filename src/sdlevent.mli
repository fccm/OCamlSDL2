(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Events handling *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryEvents}Events category} *)

type state =
  | Released
  | Pressed

val string_of_state : state -> string

type keyboard_event = {
  ke_timestamp: int32;
  ke_window_id: int32;
  ke_state: state;
  ke_repeat: int;
  scancode: Sdlscancode.t;
  keycode: Sdlkeycode.t;
  keymod: Sdlkeymod.t list;
}
(** {{:http://wiki.libsdl.org/SDL_KeyboardEvent}api doc} *)

type mouse_motion_event = {
  mm_timestamp: int32;
  mm_window_id: int32;
  mm_buttons: int list;
  mm_x: int;
  mm_y: int;
  mm_xrel: int;
  mm_yrel: int;
}
(** {{:http://wiki.libsdl.org/SDL_MouseMotionEvent}api doc} *)

type mouse_button_event = {
  mb_timestamp: int32;
  mb_window_id: int32;
  mb_button: int;
  mb_state: state;
  mb_x: int;
  mb_y: int;
}
(** {{:http://wiki.libsdl.org/SDL_MouseButtonEvent}api doc} *)

type mouse_wheel_event = {
  mw_timestamp: int32;
  mw_window_id: int32;
  mw_x: int;
  mw_y: int;
}
(** {{:http://wiki.libsdl.org/SDL_MouseWheelEvent}api doc} *)

type joy_axis_event = {
  ja_timestamp: int32;
  ja_which: int;
  ja_axis: int;
  ja_value: int;
}
(** {{:http://wiki.libsdl.org/SDL_JoyAxisEvent}api doc} *)

type joy_button_event = {
  jb_timestamp: int32;
  jb_which: int;
  jb_button: int;
  jb_state: state;
}
(** {{:http://wiki.libsdl.org/SDL_JoyButtonEvent}api doc} *)

type joy_hat_event = {
  jh_timestamp: int32;
  jh_which: int;
  jh_hat: int;
  jh_dir: Sdlhat.direction;
  jh_pos: Sdlhat.positions;
}
(** {{:http://wiki.libsdl.org/SDL_JoyHatEvent}api doc} *)

type joy_device_change =
  | JoyDevice_Added
  | JoyDevice_Removed

val string_of_joy_device_change :
  joy_device_change -> string

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
  | WindowEvent_None
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
  | WindowEvent_Take_Focus
  | WindowEvent_Hit_Test

val string_of_window_event_kind :
  window_event_kind -> string

type window_event = {
  we_timestamp: int32;
  window_ID: int32;
  kind : window_event_kind;
}
(** {{:http://wiki.libsdl.org/SDL_WindowEvent}api doc} *)

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
(** {{:http://wiki.libsdl.org/SDL_PollEvent}api doc} *)

val to_string : t -> string

