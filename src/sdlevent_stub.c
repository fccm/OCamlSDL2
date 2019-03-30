/* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*/
#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>

#include <SDL_events.h>
#include <SDL_keyboard.h>
#include <SDL_keycode.h>
#include <SDL_scancode.h>
#include "sdlkeymod_stub.h"

#define Val_none Val_int(0)

static value
Val_some(value v)
{   
    value some = caml_alloc(1, 0);
    Store_field(some, 0, v);
    return some;
}

#if 0
    SDL_WindowEvent window;           /* Window */
    SDL_KeyboardEvent key;            /* Keyboard */
    SDL_TextEditingEvent edit;        /* Text editing */
    SDL_TextInputEvent text;          /* Text input */
    SDL_MouseMotionEvent motion;      /* Mouse motion */
    SDL_MouseButtonEvent button;      /* Mouse button */
    SDL_MouseWheelEvent wheel;        /* Mouse wheel */
    SDL_JoyAxisEvent jaxis;           /* Joystick axis */
    SDL_JoyBallEvent jball;           /* Joystick ball */
    SDL_JoyHatEvent jhat;             /* Joystick hat */
    SDL_JoyButtonEvent jbutton;       /* Joystick button */
    SDL_JoyDeviceEvent jdevice;       /* Joystick device change */
    SDL_ControllerAxisEvent caxis;      /* Game Controller button */
    SDL_ControllerButtonEvent cbutton;  /* Game Controller button */
    SDL_ControllerDeviceEvent cdevice;  /* Game Controller device */
    SDL_QuitEvent quit;
    SDL_UserEvent user;               /* Custom */
    SDL_SysWMEvent syswm;             /* System dependent window */
    SDL_TouchFingerEvent tfinger;     /* Touch finger */
    SDL_TouchButtonEvent tbutton;     /* Touch button */
    SDL_MultiGestureEvent mgesture;   /* Multi Finger Gesture data */
    SDL_DollarGestureEvent dgesture;  /* Multi Finger Gesture data */
    SDL_DropEvent drop;               /* Drag and drop */
#endif

#define Val_Joy_Ball_Motion             Val_int(0)
#define Val_Controller_Axis_Motion      Val_int(1)
#define Val_Controller_Button_Down      Val_int(2)
#define Val_Controller_Button_Up        Val_int(3)
#define Val_Controller_Device_Added     Val_int(4)
#define Val_Controller_Device_Removed   Val_int(5)
#define Val_Controller_Device_Remapped  Val_int(6)
#define Val_Finger_Down                 Val_int(7)
#define Val_Finger_Up                   Val_int(8)
#define Val_Finger_Motion               Val_int(9)
#define Val_Dollar_Gesture              Val_int(10)
#define Val_Dollar_Record               Val_int(11)
#define Val_Multi_Gesture               Val_int(12)
#define Val_Clipboard_Update            Val_int(13)
#define Val_Drop_File                   Val_int(14)
#define Val_User_Event                  Val_int(15)
#define Val_SYSWM_Event                 Val_int(16)
#define Val_SDL_APP_TERMINATING         Val_int(17)
#define Val_SDL_APP_LOWMEMORY           Val_int(18)
#define Val_SDL_APP_WILLENTERBACKGROUND Val_int(19)
#define Val_SDL_APP_DIDENTERBACKGROUND  Val_int(20)
#define Val_SDL_APP_WILLENTERFOREGROUND Val_int(21)
#define Val_SDL_APP_DIDENTERFOREGROUND  Val_int(22)
#define Val_SDL_DISPLAYEVENT            Val_int(23)
#define Val_SDL_KEYMAPCHANGED           Val_int(24)
#define Val_SDL_DROPTEXT                Val_int(25)
#define Val_SDL_DROPBEGIN               Val_int(26)
#define Val_SDL_DROPCOMPLETE            Val_int(27)
#define Val_SDL_AUDIODEVICEADDED        Val_int(28)
#define Val_SDL_AUDIODEVICEREMOVED      Val_int(29)
#define Val_SDL_SENSORUPDATE            Val_int(30)
#define Val_SDL_RENDER_TARGETS_RESET    Val_int(31)
#define Val_SDL_RENDER_DEVICE_RESET     Val_int(32)



#define Tag_Quit                        (0)
#define Tag_Mouse_Motion                (1)
#define Tag_Mouse_Button_Down           (2)
#define Tag_Mouse_Button_Up             (3)
#define Tag_Mouse_Wheel                 (4)
#define Tag_KeyDown                     (5)
#define Tag_KeyUp                       (6)
#define Tag_Text_Editing                (7)
#define Tag_Text_Input                  (8)
#define Tag_Joy_Axis_Motion             (9)
#define Tag_Joy_Hat_Motion              (10)
#define Tag_Joy_Button_Down             (11)
#define Tag_Joy_Button_Up               (12)
#define Tag_Joy_Device_Added            (13)
#define Tag_Joy_Device_Removed          (14)
#define Tag_Window_Event                (15)


static value Val_SDL_QuitEvent(SDL_QuitEvent * e) {
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Quit);
    rec = caml_alloc(1, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}


static inline value Val_state(Uint8 state)
{
    switch (state) {
    case SDL_RELEASED:  return Val_int(0);
    case SDL_PRESSED:   return Val_int(1);
    }
    caml_failwith("Keysym state");
}

static inline value Val_SDL_Keycode(SDL_Keycode kcode)
{
    switch (kcode) {
#include "sdl_keycode.gen.c"
    }
    return Val_int(0);
}

static inline value Val_SDL_Scancode(SDL_Scancode scancode)
{
    switch (scancode) {
#include "sdl_scancode.gen.c"
    }
    return Val_int(0);
}

static inline value
Val_SDL_KeyboardEvent(SDL_KeyboardEvent * e, int tag)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    SDL_Keysym *keysym = &(e->keysym);
    ret = caml_alloc(1, tag);
    rec = caml_alloc(7, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, Val_state(e->state));
    Store_field(rec, 3, Val_int(e->repeat));
    Store_field(rec, 4, Val_SDL_Scancode(keysym->scancode));
    Store_field(rec, 5, Val_SDL_Keycode(keysym->sym));
    Store_field(rec, 6, Val_SDL_Keymod(keysym->mod));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

#define Val_SDL_KeyDown(ev)  Val_SDL_KeyboardEvent(ev, Tag_KeyDown)
#define Val_SDL_KeyUp(ev)    Val_SDL_KeyboardEvent(ev, Tag_KeyUp  )


static value
Val_MouseMotionState(Uint8 buttons_mask)
{
    CAMLparam0();
    CAMLlocal2(li, cons);
    li = Val_emptylist;
    int i;
    for (i = 7; i >= 0; --i) {
        if ((buttons_mask >> i) & 1) {
            cons = caml_alloc_small(2, 0);
            Store_field(cons, 0, Val_int(i+1));
            Store_field(cons, 1, li);
            li = cons;
        }
    }
    CAMLreturn(li);
}

static inline value
Val_SDL_MouseMotionEvent(SDL_MouseMotionEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Mouse_Motion);
    rec = caml_alloc(7, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, Val_MouseMotionState(e->state));
    Store_field(rec, 3, Val_int(e->x));
    Store_field(rec, 4, Val_int(e->y));
    Store_field(rec, 5, Val_int(e->xrel));
    Store_field(rec, 6, Val_int(e->yrel));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_MouseButtonEvent(SDL_MouseButtonEvent * e, int tag)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, tag);
    rec = caml_alloc(6, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, Val_int(e->button));
    Store_field(rec, 3, Val_state(e->state));
    Store_field(rec, 4, Val_int(e->x));
    Store_field(rec, 5, Val_int(e->y));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

#define Val_SDL_MouseButtonDown(ev) Val_SDL_MouseButtonEvent(ev, Tag_Mouse_Button_Down)
#define Val_SDL_MouseButtonUp(ev)   Val_SDL_MouseButtonEvent(ev, Tag_Mouse_Button_Up)


static inline value
Val_SDL_MouseWheelEvent(SDL_MouseWheelEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Mouse_Wheel);
    rec = caml_alloc(4, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, Val_int(e->x));
    Store_field(rec, 3, Val_int(e->y));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_JoyAxisEvent(SDL_JoyAxisEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Joy_Axis_Motion);
    rec = caml_alloc(4, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, Val_int(e->which));
    Store_field(rec, 2, Val_int(e->axis));
    Store_field(rec, 3, Val_int(e->value));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_JoyButtonEvent(SDL_JoyButtonEvent * e, int tag)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, tag);
    rec = caml_alloc(4, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, Val_int(e->which));
    Store_field(rec, 2, Val_int(e->button));
    Store_field(rec, 3, Val_state(e->state));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

#define Val_SDL_JoyButtonDown(ev) Val_SDL_JoyButtonEvent(ev, Tag_Joy_Button_Down)
#define Val_SDL_JoyButtonUp(ev)   Val_SDL_JoyButtonEvent(ev, Tag_Joy_Button_Up)


#define Val_SDL_HAT_CENTERED        Val_int(0)
#define Val_SDL_HAT_UP              Val_int(1)
#define Val_SDL_HAT_RIGHT           Val_int(2)
#define Val_SDL_HAT_DOWN            Val_int(3)
#define Val_SDL_HAT_LEFT            Val_int(4)
#define Val_SDL_HAT_RIGHTUP         Val_int(5)
#define Val_SDL_HAT_RIGHTDOWN       Val_int(6)
#define Val_SDL_HAT_LEFTUP          Val_int(7)
#define Val_SDL_HAT_LEFTDOWN        Val_int(8)

#define Val_hat_position(b, ret) \
  do{ \
    ret = caml_alloc(4, 0); \
    Store_field(ret, 0, Val_bool(0 != ((b) & SDL_HAT_LEFT))); \
    Store_field(ret, 1, Val_bool(0 != ((b) & SDL_HAT_RIGHT))); \
    Store_field(ret, 2, Val_bool(0 != ((b) & SDL_HAT_UP))); \
    Store_field(ret, 3, Val_bool(0 != ((b) & SDL_HAT_DOWN))); \
  }while(0)

static value
Val_direction(Uint8 b)
{
    switch (b)
    {
    case SDL_HAT_CENTERED:  return Val_SDL_HAT_CENTERED;
    case SDL_HAT_UP:        return Val_SDL_HAT_UP;
    case SDL_HAT_RIGHT:     return Val_SDL_HAT_RIGHT;
    case SDL_HAT_DOWN:      return Val_SDL_HAT_DOWN;
    case SDL_HAT_LEFT:      return Val_SDL_HAT_LEFT;
    case SDL_HAT_RIGHTUP:   return Val_SDL_HAT_RIGHTUP;
    case SDL_HAT_RIGHTDOWN: return Val_SDL_HAT_RIGHTDOWN;
    case SDL_HAT_LEFTUP:    return Val_SDL_HAT_LEFTUP;
    case SDL_HAT_LEFTDOWN:  return Val_SDL_HAT_LEFTDOWN;
    }
    caml_failwith("JoyHat direction");
    return 0;
}

static inline value
Val_SDL_JoyHatEvent(SDL_JoyHatEvent * e)
{
    CAMLparam0();
    CAMLlocal3(ret, rec, hat_pos);
    Val_hat_position(e->value, hat_pos);
    ret = caml_alloc(1, Tag_Joy_Hat_Motion);
    rec = caml_alloc(5, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, Val_int(e->which));
    Store_field(rec, 2, Val_int(e->hat));
    Store_field(rec, 3, Val_direction(e->value));
    Store_field(rec, 4, hat_pos);
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value Val_SDL_JoyDevice(Uint32 type)
{
    switch (type) {
    case SDL_JOYDEVICEADDED:    return Val_int(0);
    case SDL_JOYDEVICEREMOVED:  return Val_int(1);
    }
    caml_failwith("joy_device_change");
}

static inline value
Val_SDL_JoyDeviceEvent(SDL_JoyDeviceEvent * e, int tag)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, tag);
    rec = caml_alloc(3, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, Val_int(e->which));
    Store_field(rec, 2, Val_SDL_JoyDevice(e->type));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

#define Val_SDL_JoyDeviceAdded(ev)    Val_SDL_JoyDeviceEvent(ev, Tag_Joy_Device_Added)
#define Val_SDL_JoyDeviceRemoved(ev)  Val_SDL_JoyDeviceEvent(ev, Tag_Joy_Device_Removed)


#define Val_WindowEvent_None            Val_int(0)
#define Val_WindowEvent_Shown           Val_int(1)
#define Val_WindowEvent_Hidden          Val_int(2)
#define Val_WindowEvent_Exposed         Val_int(3)
#define Val_WindowEvent_Minimized       Val_int(4)
#define Val_WindowEvent_Maximized       Val_int(5)
#define Val_WindowEvent_Restored        Val_int(6)
#define Val_WindowEvent_Enter           Val_int(7)
#define Val_WindowEvent_Leave           Val_int(8)
#define Val_WindowEvent_Focus_Gained    Val_int(9)
#define Val_WindowEvent_Focus_Lost      Val_int(10)
#define Val_WindowEvent_Close           Val_int(11)
#define Val_WindowEvent_Take_Focus      Val_int(12)
#define Val_WindowEvent_Hit_Test        Val_int(13)

#define Tag_WindowEvent_Moved           (0)
#define Tag_WindowEvent_Resized         (1)
#define Tag_WindowEvent_Size_Changed    (2)

static inline value
Val_WindowEvent_XY(SDL_WindowEvent * e, int tag)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, tag);
    rec = caml_alloc(2, 0);
    Store_field(rec, 0, Val_int(e->data1));
    Store_field(rec, 1, Val_int(e->data2));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

#define Val_WindowEvent_Moved(e)   Val_WindowEvent_XY(e,Tag_WindowEvent_Moved)
#define Val_WindowEvent_Resized(e) Val_WindowEvent_XY(e,Tag_WindowEvent_Resized)
#define Val_WindowEvent_Resized(e) Val_WindowEvent_XY(e,Tag_WindowEvent_Resized)

static inline value
Val_WindowEvent_Kind(SDL_WindowEvent * e)
{
    switch (e->event) {
    case SDL_WINDOWEVENT_NONE:          return Val_WindowEvent_None;
    case SDL_WINDOWEVENT_SHOWN:         return Val_WindowEvent_Shown;
    case SDL_WINDOWEVENT_HIDDEN:        return Val_WindowEvent_Hidden;
    case SDL_WINDOWEVENT_EXPOSED:       return Val_WindowEvent_Exposed;
    case SDL_WINDOWEVENT_MOVED:         return Val_WindowEvent_Moved(e);
    case SDL_WINDOWEVENT_RESIZED:       return Val_WindowEvent_Resized(e);
    case SDL_WINDOWEVENT_SIZE_CHANGED:  return Val_WindowEvent_Resized(e);
    case SDL_WINDOWEVENT_MINIMIZED:     return Val_WindowEvent_Minimized;
    case SDL_WINDOWEVENT_MAXIMIZED:     return Val_WindowEvent_Maximized;
    case SDL_WINDOWEVENT_RESTORED:      return Val_WindowEvent_Restored;
    case SDL_WINDOWEVENT_ENTER:         return Val_WindowEvent_Enter;
    case SDL_WINDOWEVENT_LEAVE:         return Val_WindowEvent_Leave;
    case SDL_WINDOWEVENT_FOCUS_GAINED:  return Val_WindowEvent_Focus_Gained;
    case SDL_WINDOWEVENT_FOCUS_LOST:    return Val_WindowEvent_Focus_Lost;
    case SDL_WINDOWEVENT_CLOSE:         return Val_WindowEvent_Close;
    case SDL_WINDOWEVENT_TAKE_FOCUS:    return Val_WindowEvent_Take_Focus;
    case SDL_WINDOWEVENT_HIT_TEST:      return Val_WindowEvent_Hit_Test;

    default:
        caml_failwith("window_event_kind");
    }
}

static inline value
Val_SDL_WindowEvent(SDL_WindowEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Window_Event);
    rec = caml_alloc(3, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, Val_WindowEvent_Kind(e));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_TextEditingEvent(SDL_TextEditingEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Text_Editing);
    rec = caml_alloc(5, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, caml_copy_string(e->text));
    Store_field(rec, 3, Val_int(e->start));
    Store_field(rec, 4, Val_int(e->length));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_TextInputEvent(SDL_TextInputEvent * e)
{
    CAMLparam0();
    CAMLlocal2(ret, rec);
    ret = caml_alloc(1, Tag_Text_Input);
    rec = caml_alloc(3, 0);
    Store_field(rec, 0, caml_copy_int32(e->timestamp));
    Store_field(rec, 1, caml_copy_int32(e->windowID));
    Store_field(rec, 2, caml_copy_string(e->text));
    Store_field(ret, 0, rec);
    CAMLreturn(ret);
}

static inline value
Val_SDL_Event(SDL_Event * event)
{
    switch (event->type)
    {
    case SDL_MOUSEMOTION:       return Val_SDL_MouseMotionEvent(&(event->motion));
    case SDL_MOUSEBUTTONDOWN:   return Val_SDL_MouseButtonDown(&(event->button));
    case SDL_MOUSEBUTTONUP:     return Val_SDL_MouseButtonUp(&(event->button));
    case SDL_MOUSEWHEEL:        return Val_SDL_MouseWheelEvent(&(event->wheel));
    case SDL_KEYDOWN:           return Val_SDL_KeyDown(&(event->key));
    case SDL_KEYUP:             return Val_SDL_KeyUp(&(event->key));
    case SDL_TEXTEDITING:       return Val_SDL_TextEditingEvent(&(event->edit));
    case SDL_TEXTINPUT:         return Val_SDL_TextInputEvent(&(event->text));
    case SDL_JOYAXISMOTION:     return Val_SDL_JoyAxisEvent(&(event->jaxis));
    case SDL_JOYBALLMOTION:     return Val_Joy_Ball_Motion;
    case SDL_JOYHATMOTION:      return Val_SDL_JoyHatEvent(&(event->jhat));
    case SDL_JOYBUTTONDOWN:     return Val_SDL_JoyButtonDown(&(event->jbutton));
    case SDL_JOYBUTTONUP:       return Val_SDL_JoyButtonUp(&(event->jbutton));
    case SDL_JOYDEVICEADDED:    return Val_SDL_JoyDeviceAdded(&(event->jdevice));
    case SDL_JOYDEVICEREMOVED:  return Val_SDL_JoyDeviceRemoved(&(event->jdevice));
    case SDL_CONTROLLERAXISMOTION:      return Val_Controller_Axis_Motion;
    case SDL_CONTROLLERBUTTONDOWN:      return Val_Controller_Button_Down;
    case SDL_CONTROLLERBUTTONUP:        return Val_Controller_Button_Up;
    case SDL_CONTROLLERDEVICEADDED:     return Val_Controller_Device_Added;
    case SDL_CONTROLLERDEVICEREMOVED:   return Val_Controller_Device_Removed;
    case SDL_CONTROLLERDEVICEREMAPPED:  return Val_Controller_Device_Remapped;
    case SDL_FINGERDOWN:        return Val_Finger_Down;
    case SDL_FINGERUP:          return Val_Finger_Up;
    case SDL_FINGERMOTION:      return Val_Finger_Motion;
    case SDL_DOLLARGESTURE:     return Val_Dollar_Gesture;
    case SDL_DOLLARRECORD:      return Val_Dollar_Record;
    case SDL_MULTIGESTURE:      return Val_Multi_Gesture;
    case SDL_CLIPBOARDUPDATE:   return Val_Clipboard_Update;
    case SDL_DROPFILE:          return Val_Drop_File;
    case SDL_USEREVENT:         return Val_User_Event;
    case SDL_WINDOWEVENT:       return Val_SDL_WindowEvent(&(event->window));
    case SDL_SYSWMEVENT:        return Val_SYSWM_Event;
    case SDL_QUIT:              return Val_SDL_QuitEvent(&(event->quit));
    case SDL_APP_TERMINATING:            return Val_SDL_APP_TERMINATING;
    case SDL_APP_LOWMEMORY:              return Val_SDL_APP_LOWMEMORY;
    case SDL_APP_WILLENTERBACKGROUND:    return Val_SDL_APP_WILLENTERBACKGROUND;
    case SDL_APP_DIDENTERBACKGROUND:     return Val_SDL_APP_DIDENTERBACKGROUND;
    case SDL_APP_WILLENTERFOREGROUND:    return Val_SDL_APP_WILLENTERFOREGROUND;
    case SDL_APP_DIDENTERFOREGROUND:     return Val_SDL_APP_DIDENTERFOREGROUND;
    case SDL_DISPLAYEVENT:               return Val_SDL_DISPLAYEVENT;
    case SDL_KEYMAPCHANGED:              return Val_SDL_KEYMAPCHANGED;
    case SDL_DROPTEXT:                   return Val_SDL_DROPTEXT;
    case SDL_DROPBEGIN:                  return Val_SDL_DROPBEGIN;
    case SDL_DROPCOMPLETE:               return Val_SDL_DROPCOMPLETE;
    case SDL_AUDIODEVICEADDED:           return Val_SDL_AUDIODEVICEADDED;
    case SDL_AUDIODEVICEREMOVED:         return Val_SDL_AUDIODEVICEREMOVED;
    case SDL_SENSORUPDATE:               return Val_SDL_SENSORUPDATE;
    case SDL_RENDER_TARGETS_RESET:       return Val_SDL_RENDER_TARGETS_RESET;
    case SDL_RENDER_DEVICE_RESET:        return Val_SDL_RENDER_DEVICE_RESET;

    default: caml_failwith("SDL Event");
    }
    caml_failwith("SDL Event");
}

CAMLprim value
caml_SDL_PollEvent(value unit)
{
    SDL_Event event;
    int r = SDL_PollEvent(&event);
    if (!r) return Val_none;
    return Val_some(Val_SDL_Event(&event));
}

/* vim: set sw=4 sts=4 ts=4 et: */
