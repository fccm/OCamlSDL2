(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2022 Carsten Elton Sørensen
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Hint kind *)

type t =
| AccelerometerAsJoystick
| AndroidApkExpansionMainFileVersion
| AndroidApkExpansionPatchFileVersion
| AndroidSeparateMouseAndTouch
| AppleTvControllerUiEvents
| AppleTvRemoteAllowRotation
| BmpSaveLegacyFormat
| EmscriptenAsyncify
| EmscriptenKeyboardElement
| FramebufferAcceleration
| Gamecontrollerconfig
| GrabKeyboard
| IdleTimerDisabled
| ImeInternalEditing
| JoystickAllowBackgroundEvents
| MacBackgroundApp
| MacCtrlClickEmulateRightClick
| MouseFocusClickthrough
| MouseRelativeModeWarp
| MouseRelativeScaling
| NoSignalHandlers
| Orientations
| RenderDirect3d11Debug
| RenderDirect3dThreadsafe
| RenderDriver
| RenderOpenglShaders
| RenderScaleQuality
| RenderVsync
| RpiVideoLayer
| ThreadStackSize
| TimerResolution
| VideoAllowScreensaver
| VideoHighdpiDisabled
| VideoMacFullscreenSpaces
| VideoMinimizeOnFocusLoss
| VideoWinD3dcompiler
| VideoWindowSharePixelFormat
| VideoX11NetWmPing
| VideoX11Xinerama
| VideoX11Xrandr
| VideoX11Xvidmode
| WindowFrameUsableWhileCursorHidden
| WindowsDisableThreadNaming
| WindowsEnableMessageloop
| WindowsNoCloseOnAltF4
| WinrtHandleBackButton
| WinrtPrivacyPolicyLabel
| WinrtPrivacyPolicyUrl
| XinputEnabled
| XinputUseOldJoystickMapping


let to_string = function
  | AccelerometerAsJoystick             -> "SDL_ACCELEROMETER_AS_JOYSTICK"
  | AndroidApkExpansionMainFileVersion  -> "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION"
  | AndroidApkExpansionPatchFileVersion -> "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION"
  | AndroidSeparateMouseAndTouch        -> "SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH"
  | AppleTvControllerUiEvents           -> "SDL_APPLE_TV_CONTROLLER_UI_EVENTS"
  | AppleTvRemoteAllowRotation          -> "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION"
  | BmpSaveLegacyFormat                 -> "SDL_BMP_SAVE_LEGACY_FORMAT"
  | EmscriptenAsyncify                  -> "SDL_EMSCRIPTEN_ASYNCIFY"
  | EmscriptenKeyboardElement           -> "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT"
  | FramebufferAcceleration             -> "SDL_FRAMEBUFFER_ACCELERATION"
  | Gamecontrollerconfig                -> "SDL_GAMECONTROLLERCONFIG"
  | GrabKeyboard                        -> "SDL_GRAB_KEYBOARD"
  | IdleTimerDisabled                   -> "SDL_IDLE_TIMER_DISABLED"
  | ImeInternalEditing                  -> "SDL_IME_INTERNAL_EDITING"
  | JoystickAllowBackgroundEvents       -> "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"
  | MacBackgroundApp                    -> "SDL_MAC_BACKGROUND_APP"
  | MacCtrlClickEmulateRightClick       -> "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK"
  | MouseFocusClickthrough              -> "SDL_MOUSE_FOCUS_CLICKTHROUGH"
  | MouseRelativeModeWarp               -> "SDL_MOUSE_RELATIVE_MODE_WARP"
  | MouseRelativeScaling                -> "SDL_MOUSE_RELATIVE_SCALING"
  | NoSignalHandlers                    -> "SDL_NO_SIGNAL_HANDLERS"
  | Orientations                        -> "SDL_ORIENTATIONS"
  | RenderDirect3d11Debug               -> "SDL_RENDER_DIRECT3D11_DEBUG"
  | RenderDirect3dThreadsafe            -> "SDL_RENDER_DIRECT3D_THREADSAFE"
  | RenderDriver                        -> "SDL_RENDER_DRIVER"
  | RenderOpenglShaders                 -> "SDL_RENDER_OPENGL_SHADERS"
  | RenderScaleQuality                  -> "SDL_RENDER_SCALE_QUALITY"
  | RenderVsync                         -> "SDL_RENDER_VSYNC"
  | RpiVideoLayer                       -> "SDL_RPI_VIDEO_LAYER"
  | ThreadStackSize                     -> "SDL_THREAD_STACK_SIZE"
  | TimerResolution                     -> "SDL_TIMER_RESOLUTION"
  | VideoAllowScreensaver               -> "SDL_VIDEO_ALLOW_SCREENSAVER"
  | VideoHighdpiDisabled                -> "SDL_VIDEO_HIGHDPI_DISABLED"
  | VideoMacFullscreenSpaces            -> "SDL_VIDEO_MAC_FULLSCREEN_SPACES"
  | VideoMinimizeOnFocusLoss            -> "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS"
  | VideoWinD3dcompiler                 -> "SDL_VIDEO_WIN_D3DCOMPILER"
  | VideoWindowSharePixelFormat         -> "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT"
  | VideoX11NetWmPing                   -> "SDL_VIDEO_X11_NET_WM_PING"
  | VideoX11Xinerama                    -> "SDL_VIDEO_X11_XINERAMA"
  | VideoX11Xrandr                      -> "SDL_VIDEO_X11_XRANDR"
  | VideoX11Xvidmode                    -> "SDL_VIDEO_X11_XVIDMODE"
  | WindowFrameUsableWhileCursorHidden  -> "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN"
  | WindowsDisableThreadNaming          -> "SDL_WINDOWS_DISABLE_THREAD_NAMING"
  | WindowsEnableMessageloop            -> "SDL_WINDOWS_ENABLE_MESSAGELOOP"
  | WindowsNoCloseOnAltF4               -> "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4"
  | WinrtHandleBackButton               -> "SDL_WINRT_HANDLE_BACK_BUTTON"
  | WinrtPrivacyPolicyLabel             -> "SDL_WINRT_PRIVACY_POLICY_LABEL"
  | WinrtPrivacyPolicyUrl               -> "SDL_WINRT_PRIVACY_POLICY_URL"
  | XinputEnabled                       -> "SDL_XINPUT_ENABLED"
  | XinputUseOldJoystickMapping         -> "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING"


let of_string s =
  match String.uppercase_ascii s with
  | "SDL_ACCELEROMETER_AS_JOYSTICK"                -> AccelerometerAsJoystick
  | "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION"  -> AndroidApkExpansionMainFileVersion
  | "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION" -> AndroidApkExpansionPatchFileVersion
  | "SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH"         -> AndroidSeparateMouseAndTouch
  | "SDL_APPLE_TV_CONTROLLER_UI_EVENTS"            -> AppleTvControllerUiEvents
  | "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION"           -> AppleTvRemoteAllowRotation
  | "SDL_BMP_SAVE_LEGACY_FORMAT"                   -> BmpSaveLegacyFormat
  | "SDL_EMSCRIPTEN_ASYNCIFY"                      -> EmscriptenAsyncify
  | "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT"              -> EmscriptenKeyboardElement
  | "SDL_FRAMEBUFFER_ACCELERATION"                 -> FramebufferAcceleration
  | "SDL_GAMECONTROLLERCONFIG"                     -> Gamecontrollerconfig
  | "SDL_GRAB_KEYBOARD"                            -> GrabKeyboard
  | "SDL_IDLE_TIMER_DISABLED"                      -> IdleTimerDisabled
  | "SDL_IME_INTERNAL_EDITING"                     -> ImeInternalEditing
  | "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"         -> JoystickAllowBackgroundEvents
  | "SDL_MAC_BACKGROUND_APP"                       -> MacBackgroundApp
  | "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK"       -> MacCtrlClickEmulateRightClick
  | "SDL_MOUSE_FOCUS_CLICKTHROUGH"                 -> MouseFocusClickthrough
  | "SDL_MOUSE_RELATIVE_MODE_WARP"                 -> MouseRelativeModeWarp
  | "SDL_MOUSE_RELATIVE_SCALING"                   -> MouseRelativeScaling
  | "SDL_NO_SIGNAL_HANDLERS"                       -> NoSignalHandlers
  | "SDL_ORIENTATIONS"                             -> Orientations
  | "SDL_RENDER_DIRECT3D11_DEBUG"                  -> RenderDirect3d11Debug
  | "SDL_RENDER_DIRECT3D_THREADSAFE"               -> RenderDirect3dThreadsafe
  | "SDL_RENDER_DRIVER"                            -> RenderDriver
  | "SDL_RENDER_OPENGL_SHADERS"                    -> RenderOpenglShaders
  | "SDL_RENDER_SCALE_QUALITY"                     -> RenderScaleQuality
  | "SDL_RENDER_VSYNC"                             -> RenderVsync
  | "SDL_RPI_VIDEO_LAYER"                          -> RpiVideoLayer
  | "SDL_THREAD_STACK_SIZE"                        -> ThreadStackSize
  | "SDL_TIMER_RESOLUTION"                         -> TimerResolution
  | "SDL_VIDEO_ALLOW_SCREENSAVER"                  -> VideoAllowScreensaver
  | "SDL_VIDEO_HIGHDPI_DISABLED"                   -> VideoHighdpiDisabled
  | "SDL_VIDEO_MAC_FULLSCREEN_SPACES"              -> VideoMacFullscreenSpaces
  | "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS"             -> VideoMinimizeOnFocusLoss
  | "SDL_VIDEO_WIN_D3DCOMPILER"                    -> VideoWinD3dcompiler
  | "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT"          -> VideoWindowSharePixelFormat
  | "SDL_VIDEO_X11_NET_WM_PING"                    -> VideoX11NetWmPing
  | "SDL_VIDEO_X11_XINERAMA"                       -> VideoX11Xinerama
  | "SDL_VIDEO_X11_XRANDR"                         -> VideoX11Xrandr
  | "SDL_VIDEO_X11_XVIDMODE"                       -> VideoX11Xvidmode
  | "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN"  -> WindowFrameUsableWhileCursorHidden
  | "SDL_WINDOWS_DISABLE_THREAD_NAMING"            -> WindowsDisableThreadNaming
  | "SDL_WINDOWS_ENABLE_MESSAGELOOP"               -> WindowsEnableMessageloop
  | "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4"               -> WindowsNoCloseOnAltF4
  | "SDL_WINRT_HANDLE_BACK_BUTTON"                 -> WinrtHandleBackButton
  | "SDL_WINRT_PRIVACY_POLICY_LABEL"               -> WinrtPrivacyPolicyLabel
  | "SDL_WINRT_PRIVACY_POLICY_URL"                 -> WinrtPrivacyPolicyUrl
  | "SDL_XINPUT_ENABLED"                           -> XinputEnabled
  | "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING"          -> XinputUseOldJoystickMapping
  | _ -> invalid_arg "Sdlhint.of_string"

type priority =
  | Default
  | Normal
  | Override

external sdl_set_hint : string -> string -> bool
  = "caml_SDL_SetHint"

external sdl_set_hint_with_priority : string -> string -> priority -> bool
  = "caml_SDL_SetHintWithPriority"

let set hint value =
  sdl_set_hint (to_string hint) value

let set_with_priority hint value prio =
  sdl_set_hint_with_priority (to_string hint) value prio
