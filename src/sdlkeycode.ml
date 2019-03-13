(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Keyboard keys and modifiers *)

type t =
  | Unknown
  | Return
  | Escape
  | Backspace
  | Tab
  | Space
  | Exclaim
  | QuoteDBL
  | Hash
  | Percent
  | Dollar
  | Ampersand
  | Quote
  | LeftParen
  | RightParen
  | Asterisk
  | Plus
  | Comma
  | Minus
  | Period
  | Slash
  | Num0
  | Num1
  | Num2
  | Num3
  | Num4
  | Num5
  | Num6
  | Num7
  | Num8
  | Num9
  | Colon
  | SemiColon
  | Less
  | Equals
  | Greater
  | Question
  | At
  | LeftBracket
  | BackSlash
  | RightBracket
  | Caret
  | Underscore
  | BackQuote
  | A
  | B
  | C
  | D
  | E
  | F
  | G
  | H
  | I
  | J
  | K
  | L
  | M
  | N
  | O
  | P
  | Q
  | R
  | S
  | T
  | U
  | V
  | W
  | X
  | Y
  | Z
  | CapsLock
  | F1
  | F2
  | F3
  | F4
  | F5
  | F6
  | F7
  | F8
  | F9
  | F10
  | F11
  | F12
  | PrintScreen
  | ScrollLock
  | Pause
  | Insert
  | Home
  | PageUp
  | Delete
  | End
  | PageDown
  | Right
  | Left
  | Down
  | Up
  | NumLockClear
  | KP_Divide
  | KP_Multiply
  | KP_Minus
  | KP_Plus
  | KP_Enter
  | KP_1
  | KP_2
  | KP_3
  | KP_4
  | KP_5
  | KP_6
  | KP_7
  | KP_8
  | KP_9
  | KP_0
  | KP_Period
  | Application
  | Power
  | KP_Equals
  | F13
  | F14
  | F15
  | F16
  | F17
  | F18
  | F19
  | F20
  | F21
  | F22
  | F23
  | F24
  | Execute
  | Help
  | Menu
  | Select
  | Stop
  | Again
  | Undo
  | Cut
  | Copy
  | Paste
  | Find
  | Mute
  | VolumeUp
  | VolumeDown
  | KP_Comma
  | KP_EqualsAs400
  | ALTERASE
  | SYSREQ
  | CANCEL
  | CLEAR
  | PRIOR
  | RETURN2
  | SEPARATOR
  | OUT
  | OPER
  | CLEARAGAIN
  | CRSEL
  | EXSEL
  | KP_00
  | KP_000
  | ThousandsSeparator
  | DecimalSeparator
  | CurrencyUnit
  | CurrencySubunit
  | KP_LeftParen
  | KP_RightParen
  | KP_LeftBrace
  | KP_RightBrace
  | KP_Tab
  | KP_Backspace
  | KP_A
  | KP_B
  | KP_C
  | KP_D
  | KP_E
  | KP_F
  | KP_Xor
  | KP_Power
  | KP_Percent
  | KP_Less
  | KP_Greater
  | KP_Ampersand
  | KP_DBLAmpersand
  | KP_VerticalBar
  | KP_DBLVerticalBar
  | KP_Colon
  | KP_Hash
  | KP_Space
  | KP_At
  | KP_Exclam
  | KP_MemStore
  | KP_MemRecall
  | KP_MemClear
  | KP_MemAdd
  | KP_MemSubtract
  | KP_MemMultiply
  | KP_MemDivide
  | KP_PlusMinus
  | KP_Clear
  | KP_Clearentry
  | KP_Binary
  | KP_Octal
  | KP_Decimal
  | KP_Hexadecimal
  | LCtrl
  | LShift
  | LAlt
  | LGui
  | RCtrl
  | RShift
  | RAlt
  | RGUI
  | MODE
  | AudioNext
  | AudioPrev
  | AudioStop
  | AudioPlay
  | AudioMute
  | MediaSelect
  | WWW
  | Mail
  | Calculator
  | Computer
  | AC_Search
  | AC_Home
  | AC_Back
  | AC_Forward
  | AC_Stop
  | AC_Refresh
  | AC_Bookmarks
  | BrightnessDown
  | BrightnessUp
  | DisplaySwitch
  | KBDIllumToggle
  | KBDIllumDown
  | KBDIllumUp
  | Eject
  | Sleep

let to_string = function
  | Unknown             -> "Unknown"
  | Return              -> "Return"
  | Escape              -> "Escape"
  | Backspace           -> "Backspace"
  | Tab                 -> "Tab"
  | Space               -> "Space"
  | Exclaim             -> "Exclaim"
  | QuoteDBL            -> "QuoteDBL"
  | Hash                -> "Hash"
  | Percent             -> "Percent"
  | Dollar              -> "Dollar"
  | Ampersand           -> "Ampersand"
  | Quote               -> "Quote"
  | LeftParen           -> "LeftParen"
  | RightParen          -> "RightParen"
  | Asterisk            -> "Asterisk"
  | Plus                -> "Plus"
  | Comma               -> "Comma"
  | Minus               -> "Minus"
  | Period              -> "Period"
  | Slash               -> "Slash"
  | Num0                -> "Num0"
  | Num1                -> "Num1"
  | Num2                -> "Num2"
  | Num3                -> "Num3"
  | Num4                -> "Num4"
  | Num5                -> "Num5"
  | Num6                -> "Num6"
  | Num7                -> "Num7"
  | Num8                -> "Num8"
  | Num9                -> "Num9"
  | Colon               -> "Colon"
  | SemiColon           -> "SemiColon"
  | Less                -> "Less"
  | Equals              -> "Equals"
  | Greater             -> "Greater"
  | Question            -> "Question"
  | At                  -> "At"
  | LeftBracket         -> "LeftBracket"
  | BackSlash           -> "BackSlash"
  | RightBracket        -> "RightBracket"
  | Caret               -> "Caret"
  | Underscore          -> "Underscore"
  | BackQuote           -> "BackQuote"
  | A                   -> "A"
  | B                   -> "B"
  | C                   -> "C"
  | D                   -> "D"
  | E                   -> "E"
  | F                   -> "F"
  | G                   -> "G"
  | H                   -> "H"
  | I                   -> "I"
  | J                   -> "J"
  | K                   -> "K"
  | L                   -> "L"
  | M                   -> "M"
  | N                   -> "N"
  | O                   -> "O"
  | P                   -> "P"
  | Q                   -> "Q"
  | R                   -> "R"
  | S                   -> "S"
  | T                   -> "T"
  | U                   -> "U"
  | V                   -> "V"
  | W                   -> "W"
  | X                   -> "X"
  | Y                   -> "Y"
  | Z                   -> "Z"
  | CapsLock            -> "CapsLock"
  | F1                  -> "F1"
  | F2                  -> "F2"
  | F3                  -> "F3"
  | F4                  -> "F4"
  | F5                  -> "F5"
  | F6                  -> "F6"
  | F7                  -> "F7"
  | F8                  -> "F8"
  | F9                  -> "F9"
  | F10                 -> "F10"
  | F11                 -> "F11"
  | F12                 -> "F12"
  | PrintScreen         -> "PrintScreen"
  | ScrollLock          -> "ScrollLock"
  | Pause               -> "Pause"
  | Insert              -> "Insert"
  | Home                -> "Home"
  | PageUp              -> "PageUp"
  | Delete              -> "Delete"
  | End                 -> "End"
  | PageDown            -> "PageDown"
  | Right               -> "Right"
  | Left                -> "Left"
  | Down                -> "Down"
  | Up                  -> "Up"
  | NumLockClear        -> "NumLockClear"
  | KP_Divide           -> "KP_Divide"
  | KP_Multiply         -> "KP_Multiply"
  | KP_Minus            -> "KP_Minus"
  | KP_Plus             -> "KP_Plus"
  | KP_Enter            -> "KP_Enter"
  | KP_1                -> "KP_1"
  | KP_2                -> "KP_2"
  | KP_3                -> "KP_3"
  | KP_4                -> "KP_4"
  | KP_5                -> "KP_5"
  | KP_6                -> "KP_6"
  | KP_7                -> "KP_7"
  | KP_8                -> "KP_8"
  | KP_9                -> "KP_9"
  | KP_0                -> "KP_0"
  | KP_Period           -> "KP_Period"
  | Application         -> "Application"
  | Power               -> "Power"
  | KP_Equals           -> "KP_Equals"
  | F13                 -> "F13"
  | F14                 -> "F14"
  | F15                 -> "F15"
  | F16                 -> "F16"
  | F17                 -> "F17"
  | F18                 -> "F18"
  | F19                 -> "F19"
  | F20                 -> "F20"
  | F21                 -> "F21"
  | F22                 -> "F22"
  | F23                 -> "F23"
  | F24                 -> "F24"
  | Execute             -> "Execute"
  | Help                -> "Help"
  | Menu                -> "Menu"
  | Select              -> "Select"
  | Stop                -> "Stop"
  | Again               -> "Again"
  | Undo                -> "Undo"
  | Cut                 -> "Cut"
  | Copy                -> "Copy"
  | Paste               -> "Paste"
  | Find                -> "Find"
  | Mute                -> "Mute"
  | VolumeUp            -> "VolumeUp"
  | VolumeDown          -> "VolumeDown"
  | KP_Comma            -> "KP_Comma"
  | KP_EqualsAs400      -> "KP_EqualsAs400"
  | ALTERASE            -> "ALTERASE"
  | SYSREQ              -> "SYSREQ"
  | CANCEL              -> "CANCEL"
  | CLEAR               -> "CLEAR"
  | PRIOR               -> "PRIOR"
  | RETURN2             -> "RETURN2"
  | SEPARATOR           -> "SEPARATOR"
  | OUT                 -> "OUT"
  | OPER                -> "OPER"
  | CLEARAGAIN          -> "CLEARAGAIN"
  | CRSEL               -> "CRSEL"
  | EXSEL               -> "EXSEL"
  | KP_00               -> "KP_00"
  | KP_000              -> "KP_000"
  | ThousandsSeparator  -> "ThousandsSeparator"
  | DecimalSeparator    -> "DecimalSeparator"
  | CurrencyUnit        -> "CurrencyUnit"
  | CurrencySubunit     -> "CurrencySubunit"
  | KP_LeftParen        -> "KP_LeftParen"
  | KP_RightParen       -> "KP_RightParen"
  | KP_LeftBrace        -> "KP_LeftBrace"
  | KP_RightBrace       -> "KP_RightBrace"
  | KP_Tab              -> "KP_Tab"
  | KP_Backspace        -> "KP_Backspace"
  | KP_A                -> "KP_A"
  | KP_B                -> "KP_B"
  | KP_C                -> "KP_C"
  | KP_D                -> "KP_D"
  | KP_E                -> "KP_E"
  | KP_F                -> "KP_F"
  | KP_Xor              -> "KP_Xor"
  | KP_Power            -> "KP_Power"
  | KP_Percent          -> "KP_Percent"
  | KP_Less             -> "KP_Less"
  | KP_Greater          -> "KP_Greater"
  | KP_Ampersand        -> "KP_Ampersand"
  | KP_DBLAmpersand     -> "KP_DBLAmpersand"
  | KP_VerticalBar      -> "KP_VerticalBar"
  | KP_DBLVerticalBar   -> "KP_DBLVerticalBar"
  | KP_Colon            -> "KP_Colon"
  | KP_Hash             -> "KP_Hash"
  | KP_Space            -> "KP_Space"
  | KP_At               -> "KP_At"
  | KP_Exclam           -> "KP_Exclam"
  | KP_MemStore         -> "KP_MemStore"
  | KP_MemRecall        -> "KP_MemRecall"
  | KP_MemClear         -> "KP_MemClear"
  | KP_MemAdd           -> "KP_MemAdd"
  | KP_MemSubtract      -> "KP_MemSubtract"
  | KP_MemMultiply      -> "KP_MemMultiply"
  | KP_MemDivide        -> "KP_MemDivide"
  | KP_PlusMinus        -> "KP_PlusMinus"
  | KP_Clear            -> "KP_Clear"
  | KP_Clearentry       -> "KP_Clearentry"
  | KP_Binary           -> "KP_Binary"
  | KP_Octal            -> "KP_Octal"
  | KP_Decimal          -> "KP_Decimal"
  | KP_Hexadecimal      -> "KP_Hexadecimal"
  | LCtrl               -> "LCtrl"
  | LShift              -> "LShift"
  | LAlt                -> "LAlt"
  | LGui                -> "LGui"
  | RCtrl               -> "RCtrl"
  | RShift              -> "RShift"
  | RAlt                -> "RAlt"
  | RGUI                -> "RGUI"
  | MODE                -> "MODE"
  | AudioNext           -> "AudioNext"
  | AudioPrev           -> "AudioPrev"
  | AudioStop           -> "AudioStop"
  | AudioPlay           -> "AudioPlay"
  | AudioMute           -> "AudioMute"
  | MediaSelect         -> "MediaSelect"
  | WWW                 -> "WWW"
  | Mail                -> "Mail"
  | Calculator          -> "Calculator"
  | Computer            -> "Computer"
  | AC_Search           -> "AC_Search"
  | AC_Home             -> "AC_Home"
  | AC_Back             -> "AC_Back"
  | AC_Forward          -> "AC_Forward"
  | AC_Stop             -> "AC_Stop"
  | AC_Refresh          -> "AC_Refresh"
  | AC_Bookmarks        -> "AC_Bookmarks"
  | BrightnessDown      -> "BrightnessDown"
  | BrightnessUp        -> "BrightnessUp"
  | DisplaySwitch       -> "DisplaySwitch"
  | KBDIllumToggle      -> "KBDIllumToggle"
  | KBDIllumDown        -> "KBDIllumDown"
  | KBDIllumUp          -> "KBDIllumUp"
  | Eject               -> "Eject"
  | Sleep               -> "Sleep"

let of_string s =
  match String.lowercase_ascii s with
  | "unknown"           -> Unknown
  | "return"            -> Return
  | "escape"            -> Escape
  | "backspace"         -> Backspace
  | "tab"               -> Tab
  | "space"             -> Space
  | "exclaim"           -> Exclaim
  | "quotedbl"          -> QuoteDBL
  | "hash"              -> Hash
  | "percent"           -> Percent
  | "dollar"            -> Dollar
  | "ampersand"         -> Ampersand
  | "quote"             -> Quote
  | "leftparen"         -> LeftParen
  | "rightparen"        -> RightParen
  | "asterisk"          -> Asterisk
  | "plus"              -> Plus
  | "comma"             -> Comma
  | "minus"             -> Minus
  | "period"            -> Period
  | "slash"             -> Slash
  | "num0"              -> Num0
  | "num1"              -> Num1
  | "num2"              -> Num2
  | "num3"              -> Num3
  | "num4"              -> Num4
  | "num5"              -> Num5
  | "num6"              -> Num6
  | "num7"              -> Num7
  | "num8"              -> Num8
  | "num9"              -> Num9
  | "colon"             -> Colon
  | "semicolon"         -> SemiColon
  | "less"              -> Less
  | "equals"            -> Equals
  | "greater"           -> Greater
  | "question"          -> Question
  | "at"                -> At
  | "leftbracket"       -> LeftBracket
  | "backslash"         -> BackSlash
  | "rightbracket"      -> RightBracket
  | "caret"             -> Caret
  | "underscore"        -> Underscore
  | "backquote"         -> BackQuote
  | "a"                 -> A
  | "b"                 -> B
  | "c"                 -> C
  | "d"                 -> D
  | "e"                 -> E
  | "f"                 -> F
  | "g"                 -> G
  | "h"                 -> H
  | "i"                 -> I
  | "j"                 -> J
  | "k"                 -> K
  | "l"                 -> L
  | "m"                 -> M
  | "n"                 -> N
  | "o"                 -> O
  | "p"                 -> P
  | "q"                 -> Q
  | "r"                 -> R
  | "s"                 -> S
  | "t"                 -> T
  | "u"                 -> U
  | "v"                 -> V
  | "w"                 -> W
  | "x"                 -> X
  | "y"                 -> Y
  | "z"                 -> Z
  | "capslock"          -> CapsLock
  | "f1"                -> F1
  | "f2"                -> F2
  | "f3"                -> F3
  | "f4"                -> F4
  | "f5"                -> F5
  | "f6"                -> F6
  | "f7"                -> F7
  | "f8"                -> F8
  | "f9"                -> F9
  | "f10"               -> F10
  | "f11"               -> F11
  | "f12"               -> F12
  | "printscreen"       -> PrintScreen
  | "scrolllock"        -> ScrollLock
  | "pause"             -> Pause
  | "insert"            -> Insert
  | "home"              -> Home
  | "pageup"            -> PageUp
  | "delete"            -> Delete
  | "end"               -> End
  | "pagedown"          -> PageDown
  | "right"             -> Right
  | "left"              -> Left
  | "down"              -> Down
  | "up"                -> Up
  | "numlockclear"      -> NumLockClear
  | "kp_divide"         -> KP_Divide
  | "kp_multiply"       -> KP_Multiply
  | "kp_minus"          -> KP_Minus
  | "kp_plus"           -> KP_Plus
  | "kp_enter"          -> KP_Enter
  | "kp_1"              -> KP_1
  | "kp_2"              -> KP_2
  | "kp_3"              -> KP_3
  | "kp_4"              -> KP_4
  | "kp_5"              -> KP_5
  | "kp_6"              -> KP_6
  | "kp_7"              -> KP_7
  | "kp_8"              -> KP_8
  | "kp_9"              -> KP_9
  | "kp_0"              -> KP_0
  | "kp_period"         -> KP_Period
  | "application"       -> Application
  | "power"             -> Power
  | "kp_equals"         -> KP_Equals
  | "f13"               -> F13
  | "f14"               -> F14
  | "f15"               -> F15
  | "f16"               -> F16
  | "f17"               -> F17
  | "f18"               -> F18
  | "f19"               -> F19
  | "f20"               -> F20
  | "f21"               -> F21
  | "f22"               -> F22
  | "f23"               -> F23
  | "f24"               -> F24
  | "execute"           -> Execute
  | "help"              -> Help
  | "menu"              -> Menu
  | "select"            -> Select
  | "stop"              -> Stop
  | "again"             -> Again
  | "undo"              -> Undo
  | "cut"               -> Cut
  | "copy"              -> Copy
  | "paste"             -> Paste
  | "find"              -> Find
  | "mute"              -> Mute
  | "volumeup"          -> VolumeUp
  | "volumedown"        -> VolumeDown
  | "kp_comma"          -> KP_Comma
  | "kp_equalsas400"    -> KP_EqualsAs400
  | "alterase"          -> ALTERASE
  | "sysreq"            -> SYSREQ
  | "cancel"            -> CANCEL
  | "clear"             -> CLEAR
  | "prior"             -> PRIOR
  | "return2"           -> RETURN2
  | "separator"         -> SEPARATOR
  | "out"               -> OUT
  | "oper"              -> OPER
  | "clearagain"        -> CLEARAGAIN
  | "crsel"             -> CRSEL
  | "exsel"             -> EXSEL
  | "kp_00"             -> KP_00
  | "kp_000"            -> KP_000
  | "thousandsseparator"-> ThousandsSeparator
  | "decimalseparator"  -> DecimalSeparator
  | "currencyunit"      -> CurrencyUnit
  | "currencysubunit"   -> CurrencySubunit
  | "kp_leftparen"      -> KP_LeftParen
  | "kp_rightparen"     -> KP_RightParen
  | "kp_leftbrace"      -> KP_LeftBrace
  | "kp_rightbrace"     -> KP_RightBrace
  | "kp_tab"            -> KP_Tab
  | "kp_backspace"      -> KP_Backspace
  | "kp_a"              -> KP_A
  | "kp_b"              -> KP_B
  | "kp_c"              -> KP_C
  | "kp_d"              -> KP_D
  | "kp_e"              -> KP_E
  | "kp_f"              -> KP_F
  | "kp_xor"            -> KP_Xor
  | "kp_power"          -> KP_Power
  | "kp_percent"        -> KP_Percent
  | "kp_less"           -> KP_Less
  | "kp_greater"        -> KP_Greater
  | "kp_ampersand"      -> KP_Ampersand
  | "kp_dblampersand"   -> KP_DBLAmpersand
  | "kp_verticalbar"    -> KP_VerticalBar
  | "kp_dblverticalbar" -> KP_DBLVerticalBar
  | "kp_colon"          -> KP_Colon
  | "kp_hash"           -> KP_Hash
  | "kp_space"          -> KP_Space
  | "kp_at"             -> KP_At
  | "kp_exclam"         -> KP_Exclam
  | "kp_memstore"       -> KP_MemStore
  | "kp_memrecall"      -> KP_MemRecall
  | "kp_memclear"       -> KP_MemClear
  | "kp_memadd"         -> KP_MemAdd
  | "kp_memsubtract"    -> KP_MemSubtract
  | "kp_memmultiply"    -> KP_MemMultiply
  | "kp_memdivide"      -> KP_MemDivide
  | "kp_plusminus"      -> KP_PlusMinus
  | "kp_clear"          -> KP_Clear
  | "kp_clearentry"     -> KP_Clearentry
  | "kp_binary"         -> KP_Binary
  | "kp_octal"          -> KP_Octal
  | "kp_decimal"        -> KP_Decimal
  | "kp_hexadecimal"    -> KP_Hexadecimal
  | "lctrl"             -> LCtrl
  | "lshift"            -> LShift
  | "lalt"              -> LAlt
  | "lgui"              -> LGui
  | "rctrl"             -> RCtrl
  | "rshift"            -> RShift
  | "ralt"              -> RAlt
  | "rgui"              -> RGUI
  | "mode"              -> MODE
  | "audionext"         -> AudioNext
  | "audioprev"         -> AudioPrev
  | "audiostop"         -> AudioStop
  | "audioplay"         -> AudioPlay
  | "audiomute"         -> AudioMute
  | "mediaselect"       -> MediaSelect
  | "www"               -> WWW
  | "mail"              -> Mail
  | "calculator"        -> Calculator
  | "computer"          -> Computer
  | "ac_search"         -> AC_Search
  | "ac_home"           -> AC_Home
  | "ac_back"           -> AC_Back
  | "ac_forward"        -> AC_Forward
  | "ac_stop"           -> AC_Stop
  | "ac_refresh"        -> AC_Refresh
  | "ac_bookmarks"      -> AC_Bookmarks
  | "brightnessdown"    -> BrightnessDown
  | "brightnessup"      -> BrightnessUp
  | "displayswitch"     -> DisplaySwitch
  | "kbdillumtoggle"    -> KBDIllumToggle
  | "kbdillumdown"      -> KBDIllumDown
  | "kbdillumup"        -> KBDIllumUp
  | "eject"             -> Eject
  | "sleep"             -> Sleep
  | _ -> invalid_arg "Sdlkeycode.of_string"

