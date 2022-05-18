(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2022 Carsten Elton Sørensen
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)

(** Hint kind *)

(** {{:https://wiki.libsdl.org/CategoryHints}api doc} *)

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

(** {{:http://wiki.libsdl.org/SDL_HintPriority}api doc} *)
type priority =
  | Default
  | Normal
  | Override

val to_string : t -> string
val of_string : string -> t

val set: t -> string -> bool
(** {{:http://wiki.libsdl.org/SDL_SetHint}api doc} *)

val set_with_priority: t -> string -> priority -> bool
(** {{:http://wiki.libsdl.org/SDL_SetHintWithPriority}api doc} *)
