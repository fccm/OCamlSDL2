type t =
  | UNKNOWN
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
  | Num1
  | Num2
  | Num3
  | Num4
  | Num5
  | Num6
  | Num7
  | Num8
  | Num9
  | Num0
  | RETURN
  | ESCAPE
  | BACKSPACE
  | TAB
  | SPACE
  | MINUS
  | EQUALS
  | LEFTBRACKET
  | RIGHTBRACKET
  | BACKSLASH
  | NONUSHASH
  | SEMICOLON
  | APOSTROPHE
  | GRAVE
  | COMMA
  | PERIOD
  | SLASH
  | CAPSLOCK
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
  | PRINTSCREEN
  | SCROLLLOCK
  | PAUSE
  | INSERT
  | HOME
  | PAGEUP
  | DELETE
  | END
  | PAGEDOWN
  | RIGHT
  | LEFT
  | DOWN
  | UP
  | NUMLOCKCLEAR
  | KP_DIVIDE
  | KP_MULTIPLY
  | KP_MINUS
  | KP_PLUS
  | KP_ENTER
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
  | KP_PERIOD
  | NONUSBACKSLASH
  | APPLICATION
  | POWER
  | KP_EQUALS
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
  | EXECUTE
  | HELP
  | MENU
  | SELECT
  | STOP
  | AGAIN
  | UNDO
  | CUT
  | COPY
  | PASTE
  | FIND
  | MUTE
  | VOLUMEUP
  | VOLUMEDOWN
  | KP_COMMA
  | KP_EQUALSAS400
  | INTERNATIONAL1
  | INTERNATIONAL2
  | INTERNATIONAL3
  | INTERNATIONAL4
  | INTERNATIONAL5
  | INTERNATIONAL6
  | INTERNATIONAL7
  | INTERNATIONAL8
  | INTERNATIONAL9
  | LANG1
  | LANG2
  | LANG3
  | LANG4
  | LANG5
  | LANG6
  | LANG7
  | LANG8
  | LANG9
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
  | THOUSANDSSEPARATOR
  | DECIMALSEPARATOR
  | CURRENCYUNIT
  | CURRENCYSUBUNIT
  | KP_LEFTPAREN
  | KP_RIGHTPAREN
  | KP_LEFTBRACE
  | KP_RIGHTBRACE
  | KP_TAB
  | KP_BACKSPACE
  | KP_A
  | KP_B
  | KP_C
  | KP_D
  | KP_E
  | KP_F
  | KP_XOR
  | KP_POWER
  | KP_PERCENT
  | KP_LESS
  | KP_GREATER
  | KP_AMPERSAND
  | KP_DBLAMPERSAND
  | KP_VERTICALBAR
  | KP_DBLVERTICALBAR
  | KP_COLON
  | KP_HASH
  | KP_SPACE
  | KP_AT
  | KP_EXCLAM
  | KP_MEMSTORE
  | KP_MEMRECALL
  | KP_MEMCLEAR
  | KP_MEMADD
  | KP_MEMSUBTRACT
  | KP_MEMMULTIPLY
  | KP_MEMDIVIDE
  | KP_PLUSMINUS
  | KP_CLEAR
  | KP_CLEARENTRY
  | KP_BINARY
  | KP_OCTAL
  | KP_DECIMAL
  | KP_HEXADECIMAL
  | LCTRL
  | LSHIFT
  | LALT
  | LGUI
  | RCTRL
  | RSHIFT
  | RALT
  | RGUI
  | MODE
  | AUDIONEXT
  | AUDIOPREV
  | AUDIOSTOP
  | AUDIOPLAY
  | AUDIOMUTE
  | MEDIASELECT
  | WWW
  | MAIL
  | CALCULATOR
  | COMPUTER
  | AC_SEARCH
  | AC_HOME
  | AC_BACK
  | AC_FORWARD
  | AC_STOP
  | AC_REFRESH
  | AC_BOOKMARKS
  | BRIGHTNESSDOWN
  | BRIGHTNESSUP
  | DISPLAYSWITCH
  | KBDILLUMTOGGLE
  | KBDILLUMDOWN
  | KBDILLUMUP
  | EJECT
  | SLEEP

let to_string = function
  | UNKNOWN             -> "UNKNOWN"
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
  | Num1                -> "Num1"
  | Num2                -> "Num2"
  | Num3                -> "Num3"
  | Num4                -> "Num4"
  | Num5                -> "Num5"
  | Num6                -> "Num6"
  | Num7                -> "Num7"
  | Num8                -> "Num8"
  | Num9                -> "Num9"
  | Num0                -> "Num0"
  | RETURN              -> "RETURN"
  | ESCAPE              -> "ESCAPE"
  | BACKSPACE           -> "BACKSPACE"
  | TAB                 -> "TAB"
  | SPACE               -> "SPACE"
  | MINUS               -> "MINUS"
  | EQUALS              -> "EQUALS"
  | LEFTBRACKET         -> "LEFTBRACKET"
  | RIGHTBRACKET        -> "RIGHTBRACKET"
  | BACKSLASH           -> "BACKSLASH"
  | NONUSHASH           -> "NONUSHASH"
  | SEMICOLON           -> "SEMICOLON"
  | APOSTROPHE          -> "APOSTROPHE"
  | GRAVE               -> "GRAVE"
  | COMMA               -> "COMMA"
  | PERIOD              -> "PERIOD"
  | SLASH               -> "SLASH"
  | CAPSLOCK            -> "CAPSLOCK"
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
  | PRINTSCREEN         -> "PRINTSCREEN"
  | SCROLLLOCK          -> "SCROLLLOCK"
  | PAUSE               -> "PAUSE"
  | INSERT              -> "INSERT"
  | HOME                -> "HOME"
  | PAGEUP              -> "PAGEUP"
  | DELETE              -> "DELETE"
  | END                 -> "END"
  | PAGEDOWN            -> "PAGEDOWN"
  | RIGHT               -> "RIGHT"
  | LEFT                -> "LEFT"
  | DOWN                -> "DOWN"
  | UP                  -> "UP"
  | NUMLOCKCLEAR        -> "NUMLOCKCLEAR"
  | KP_DIVIDE           -> "KP_DIVIDE"
  | KP_MULTIPLY         -> "KP_MULTIPLY"
  | KP_MINUS            -> "KP_MINUS"
  | KP_PLUS             -> "KP_PLUS"
  | KP_ENTER            -> "KP_ENTER"
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
  | KP_PERIOD           -> "KP_PERIOD"
  | NONUSBACKSLASH      -> "NONUSBACKSLASH"
  | APPLICATION         -> "APPLICATION"
  | POWER               -> "POWER"
  | KP_EQUALS           -> "KP_EQUALS"
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
  | EXECUTE             -> "EXECUTE"
  | HELP                -> "HELP"
  | MENU                -> "MENU"
  | SELECT              -> "SELECT"
  | STOP                -> "STOP"
  | AGAIN               -> "AGAIN"
  | UNDO                -> "UNDO"
  | CUT                 -> "CUT"
  | COPY                -> "COPY"
  | PASTE               -> "PASTE"
  | FIND                -> "FIND"
  | MUTE                -> "MUTE"
  | VOLUMEUP            -> "VOLUMEUP"
  | VOLUMEDOWN          -> "VOLUMEDOWN"
  | KP_COMMA            -> "KP_COMMA"
  | KP_EQUALSAS400      -> "KP_EQUALSAS400"
  | INTERNATIONAL1      -> "INTERNATIONAL1"
  | INTERNATIONAL2      -> "INTERNATIONAL2"
  | INTERNATIONAL3      -> "INTERNATIONAL3"
  | INTERNATIONAL4      -> "INTERNATIONAL4"
  | INTERNATIONAL5      -> "INTERNATIONAL5"
  | INTERNATIONAL6      -> "INTERNATIONAL6"
  | INTERNATIONAL7      -> "INTERNATIONAL7"
  | INTERNATIONAL8      -> "INTERNATIONAL8"
  | INTERNATIONAL9      -> "INTERNATIONAL9"
  | LANG1               -> "LANG1"
  | LANG2               -> "LANG2"
  | LANG3               -> "LANG3"
  | LANG4               -> "LANG4"
  | LANG5               -> "LANG5"
  | LANG6               -> "LANG6"
  | LANG7               -> "LANG7"
  | LANG8               -> "LANG8"
  | LANG9               -> "LANG9"
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
  | THOUSANDSSEPARATOR  -> "THOUSANDSSEPARATOR"
  | DECIMALSEPARATOR    -> "DECIMALSEPARATOR"
  | CURRENCYUNIT        -> "CURRENCYUNIT"
  | CURRENCYSUBUNIT     -> "CURRENCYSUBUNIT"
  | KP_LEFTPAREN        -> "KP_LEFTPAREN"
  | KP_RIGHTPAREN       -> "KP_RIGHTPAREN"
  | KP_LEFTBRACE        -> "KP_LEFTBRACE"
  | KP_RIGHTBRACE       -> "KP_RIGHTBRACE"
  | KP_TAB              -> "KP_TAB"
  | KP_BACKSPACE        -> "KP_BACKSPACE"
  | KP_A                -> "KP_A"
  | KP_B                -> "KP_B"
  | KP_C                -> "KP_C"
  | KP_D                -> "KP_D"
  | KP_E                -> "KP_E"
  | KP_F                -> "KP_F"
  | KP_XOR              -> "KP_XOR"
  | KP_POWER            -> "KP_POWER"
  | KP_PERCENT          -> "KP_PERCENT"
  | KP_LESS             -> "KP_LESS"
  | KP_GREATER          -> "KP_GREATER"
  | KP_AMPERSAND        -> "KP_AMPERSAND"
  | KP_DBLAMPERSAND     -> "KP_DBLAMPERSAND"
  | KP_VERTICALBAR      -> "KP_VERTICALBAR"
  | KP_DBLVERTICALBAR   -> "KP_DBLVERTICALBAR"
  | KP_COLON            -> "KP_COLON"
  | KP_HASH             -> "KP_HASH"
  | KP_SPACE            -> "KP_SPACE"
  | KP_AT               -> "KP_AT"
  | KP_EXCLAM           -> "KP_EXCLAM"
  | KP_MEMSTORE         -> "KP_MEMSTORE"
  | KP_MEMRECALL        -> "KP_MEMRECALL"
  | KP_MEMCLEAR         -> "KP_MEMCLEAR"
  | KP_MEMADD           -> "KP_MEMADD"
  | KP_MEMSUBTRACT      -> "KP_MEMSUBTRACT"
  | KP_MEMMULTIPLY      -> "KP_MEMMULTIPLY"
  | KP_MEMDIVIDE        -> "KP_MEMDIVIDE"
  | KP_PLUSMINUS        -> "KP_PLUSMINUS"
  | KP_CLEAR            -> "KP_CLEAR"
  | KP_CLEARENTRY       -> "KP_CLEARENTRY"
  | KP_BINARY           -> "KP_BINARY"
  | KP_OCTAL            -> "KP_OCTAL"
  | KP_DECIMAL          -> "KP_DECIMAL"
  | KP_HEXADECIMAL      -> "KP_HEXADECIMAL"
  | LCTRL               -> "LCTRL"
  | LSHIFT              -> "LSHIFT"
  | LALT                -> "LALT"
  | LGUI                -> "LGUI"
  | RCTRL               -> "RCTRL"
  | RSHIFT              -> "RSHIFT"
  | RALT                -> "RALT"
  | RGUI                -> "RGUI"
  | MODE                -> "MODE"
  | AUDIONEXT           -> "AUDIONEXT"
  | AUDIOPREV           -> "AUDIOPREV"
  | AUDIOSTOP           -> "AUDIOSTOP"
  | AUDIOPLAY           -> "AUDIOPLAY"
  | AUDIOMUTE           -> "AUDIOMUTE"
  | MEDIASELECT         -> "MEDIASELECT"
  | WWW                 -> "WWW"
  | MAIL                -> "MAIL"
  | CALCULATOR          -> "CALCULATOR"
  | COMPUTER            -> "COMPUTER"
  | AC_SEARCH           -> "AC_SEARCH"
  | AC_HOME             -> "AC_HOME"
  | AC_BACK             -> "AC_BACK"
  | AC_FORWARD          -> "AC_FORWARD"
  | AC_STOP             -> "AC_STOP"
  | AC_REFRESH          -> "AC_REFRESH"
  | AC_BOOKMARKS        -> "AC_BOOKMARKS"
  | BRIGHTNESSDOWN      -> "BRIGHTNESSDOWN"
  | BRIGHTNESSUP        -> "BRIGHTNESSUP"
  | DISPLAYSWITCH       -> "DISPLAYSWITCH"
  | KBDILLUMTOGGLE      -> "KBDILLUMTOGGLE"
  | KBDILLUMDOWN        -> "KBDILLUMDOWN"
  | KBDILLUMUP          -> "KBDILLUMUP"
  | EJECT               -> "EJECT"
  | SLEEP               -> "SLEEP"

let of_string s =
  match String.uppercase s with
  | "UNKNOWN"           -> UNKNOWN
  | "A"                 -> A
  | "B"                 -> B
  | "C"                 -> C
  | "D"                 -> D
  | "E"                 -> E
  | "F"                 -> F
  | "G"                 -> G
  | "H"                 -> H
  | "I"                 -> I
  | "J"                 -> J
  | "K"                 -> K
  | "L"                 -> L
  | "M"                 -> M
  | "N"                 -> N
  | "O"                 -> O
  | "P"                 -> P
  | "Q"                 -> Q
  | "R"                 -> R
  | "S"                 -> S
  | "T"                 -> T
  | "U"                 -> U
  | "V"                 -> V
  | "W"                 -> W
  | "X"                 -> X
  | "Y"                 -> Y
  | "Z"                 -> Z
  | "NUM1"              -> Num1
  | "NUM2"              -> Num2
  | "NUM3"              -> Num3
  | "NUM4"              -> Num4
  | "NUM5"              -> Num5
  | "NUM6"              -> Num6
  | "NUM7"              -> Num7
  | "NUM8"              -> Num8
  | "NUM9"              -> Num9
  | "NUM0"              -> Num0
  | "RETURN"            -> RETURN
  | "ESCAPE"            -> ESCAPE
  | "BACKSPACE"         -> BACKSPACE
  | "TAB"               -> TAB
  | "SPACE"             -> SPACE
  | "MINUS"             -> MINUS
  | "EQUALS"            -> EQUALS
  | "LEFTBRACKET"       -> LEFTBRACKET
  | "RIGHTBRACKET"      -> RIGHTBRACKET
  | "BACKSLASH"         -> BACKSLASH
  | "NONUSHASH"         -> NONUSHASH
  | "SEMICOLON"         -> SEMICOLON
  | "APOSTROPHE"        -> APOSTROPHE
  | "GRAVE"             -> GRAVE
  | "COMMA"             -> COMMA
  | "PERIOD"            -> PERIOD
  | "SLASH"             -> SLASH
  | "CAPSLOCK"          -> CAPSLOCK
  | "F1"                -> F1
  | "F2"                -> F2
  | "F3"                -> F3
  | "F4"                -> F4
  | "F5"                -> F5
  | "F6"                -> F6
  | "F7"                -> F7
  | "F8"                -> F8
  | "F9"                -> F9
  | "F10"               -> F10
  | "F11"               -> F11
  | "F12"               -> F12
  | "PRINTSCREEN"       -> PRINTSCREEN
  | "SCROLLLOCK"        -> SCROLLLOCK
  | "PAUSE"             -> PAUSE
  | "INSERT"            -> INSERT
  | "HOME"              -> HOME
  | "PAGEUP"            -> PAGEUP
  | "DELETE"            -> DELETE
  | "END"               -> END
  | "PAGEDOWN"          -> PAGEDOWN
  | "RIGHT"             -> RIGHT
  | "LEFT"              -> LEFT
  | "DOWN"              -> DOWN
  | "UP"                -> UP
  | "NUMLOCKCLEAR"      -> NUMLOCKCLEAR
  | "KP_DIVIDE"         -> KP_DIVIDE
  | "KP_MULTIPLY"       -> KP_MULTIPLY
  | "KP_MINUS"          -> KP_MINUS
  | "KP_PLUS"           -> KP_PLUS
  | "KP_ENTER"          -> KP_ENTER
  | "KP_1"              -> KP_1
  | "KP_2"              -> KP_2
  | "KP_3"              -> KP_3
  | "KP_4"              -> KP_4
  | "KP_5"              -> KP_5
  | "KP_6"              -> KP_6
  | "KP_7"              -> KP_7
  | "KP_8"              -> KP_8
  | "KP_9"              -> KP_9
  | "KP_0"              -> KP_0
  | "KP_PERIOD"         -> KP_PERIOD
  | "NONUSBACKSLASH"    -> NONUSBACKSLASH
  | "APPLICATION"       -> APPLICATION
  | "POWER"             -> POWER
  | "KP_EQUALS"         -> KP_EQUALS
  | "F13"               -> F13
  | "F14"               -> F14
  | "F15"               -> F15
  | "F16"               -> F16
  | "F17"               -> F17
  | "F18"               -> F18
  | "F19"               -> F19
  | "F20"               -> F20
  | "F21"               -> F21
  | "F22"               -> F22
  | "F23"               -> F23
  | "F24"               -> F24
  | "EXECUTE"           -> EXECUTE
  | "HELP"              -> HELP
  | "MENU"              -> MENU
  | "SELECT"            -> SELECT
  | "STOP"              -> STOP
  | "AGAIN"             -> AGAIN
  | "UNDO"              -> UNDO
  | "CUT"               -> CUT
  | "COPY"              -> COPY
  | "PASTE"             -> PASTE
  | "FIND"              -> FIND
  | "MUTE"              -> MUTE
  | "VOLUMEUP"          -> VOLUMEUP
  | "VOLUMEDOWN"        -> VOLUMEDOWN
  | "KP_COMMA"          -> KP_COMMA
  | "KP_EQUALSAS400"    -> KP_EQUALSAS400
  | "INTERNATIONAL1"    -> INTERNATIONAL1
  | "INTERNATIONAL2"    -> INTERNATIONAL2
  | "INTERNATIONAL3"    -> INTERNATIONAL3
  | "INTERNATIONAL4"    -> INTERNATIONAL4
  | "INTERNATIONAL5"    -> INTERNATIONAL5
  | "INTERNATIONAL6"    -> INTERNATIONAL6
  | "INTERNATIONAL7"    -> INTERNATIONAL7
  | "INTERNATIONAL8"    -> INTERNATIONAL8
  | "INTERNATIONAL9"    -> INTERNATIONAL9
  | "LANG1"             -> LANG1
  | "LANG2"             -> LANG2
  | "LANG3"             -> LANG3
  | "LANG4"             -> LANG4
  | "LANG5"             -> LANG5
  | "LANG6"             -> LANG6
  | "LANG7"             -> LANG7
  | "LANG8"             -> LANG8
  | "LANG9"             -> LANG9
  | "ALTERASE"          -> ALTERASE
  | "SYSREQ"            -> SYSREQ
  | "CANCEL"            -> CANCEL
  | "CLEAR"             -> CLEAR
  | "PRIOR"             -> PRIOR
  | "RETURN2"           -> RETURN2
  | "SEPARATOR"         -> SEPARATOR
  | "OUT"               -> OUT
  | "OPER"              -> OPER
  | "CLEARAGAIN"        -> CLEARAGAIN
  | "CRSEL"             -> CRSEL
  | "EXSEL"             -> EXSEL
  | "KP_00"             -> KP_00
  | "KP_000"            -> KP_000
  | "THOUSANDSSEPARATO  ->RTHOUSANDSSEPARATOR"
  | "DECIMALSEPARATOR"  -> DECIMALSEPARATOR
  | "CURRENCYUNIT"      -> CURRENCYUNIT
  | "CURRENCYSUBUNIT"   -> CURRENCYSUBUNIT
  | "KP_LEFTPAREN"      -> KP_LEFTPAREN
  | "KP_RIGHTPAREN"     -> KP_RIGHTPAREN
  | "KP_LEFTBRACE"      -> KP_LEFTBRACE
  | "KP_RIGHTBRACE"     -> KP_RIGHTBRACE
  | "KP_TAB"            -> KP_TAB
  | "KP_BACKSPACE"      -> KP_BACKSPACE
  | "KP_A"              -> KP_A
  | "KP_B"              -> KP_B
  | "KP_C"              -> KP_C
  | "KP_D"              -> KP_D
  | "KP_E"              -> KP_E
  | "KP_F"              -> KP_F
  | "KP_XOR"            -> KP_XOR
  | "KP_POWER"          -> KP_POWER
  | "KP_PERCENT"        -> KP_PERCENT
  | "KP_LESS"           -> KP_LESS
  | "KP_GREATER"        -> KP_GREATER
  | "KP_AMPERSAND"      -> KP_AMPERSAND
  | "KP_DBLAMPERSAND"   -> KP_DBLAMPERSAND
  | "KP_VERTICALBAR"    -> KP_VERTICALBAR
  | "KP_DBLVERTICALBAR" -> KP_DBLVERTICALBAR
  | "KP_COLON"          -> KP_COLON
  | "KP_HASH"           -> KP_HASH
  | "KP_SPACE"          -> KP_SPACE
  | "KP_AT"             -> KP_AT
  | "KP_EXCLAM"         -> KP_EXCLAM
  | "KP_MEMSTORE"       -> KP_MEMSTORE
  | "KP_MEMRECALL"      -> KP_MEMRECALL
  | "KP_MEMCLEAR"       -> KP_MEMCLEAR
  | "KP_MEMADD"         -> KP_MEMADD
  | "KP_MEMSUBTRACT"    -> KP_MEMSUBTRACT
  | "KP_MEMMULTIPLY"    -> KP_MEMMULTIPLY
  | "KP_MEMDIVIDE"      -> KP_MEMDIVIDE
  | "KP_PLUSMINUS"      -> KP_PLUSMINUS
  | "KP_CLEAR"          -> KP_CLEAR
  | "KP_CLEARENTRY"     -> KP_CLEARENTRY
  | "KP_BINARY"         -> KP_BINARY
  | "KP_OCTAL"          -> KP_OCTAL
  | "KP_DECIMAL"        -> KP_DECIMAL
  | "KP_HEXADECIMAL"    -> KP_HEXADECIMAL
  | "LCTRL"             -> LCTRL
  | "LSHIFT"            -> LSHIFT
  | "LALT"              -> LALT
  | "LGUI"              -> LGUI
  | "RCTRL"             -> RCTRL
  | "RSHIFT"            -> RSHIFT
  | "RALT"              -> RALT
  | "RGUI"              -> RGUI
  | "MODE"              -> MODE
  | "AUDIONEXT"         -> AUDIONEXT
  | "AUDIOPREV"         -> AUDIOPREV
  | "AUDIOSTOP"         -> AUDIOSTOP
  | "AUDIOPLAY"         -> AUDIOPLAY
  | "AUDIOMUTE"         -> AUDIOMUTE
  | "MEDIASELECT"       -> MEDIASELECT
  | "WWW"               -> WWW
  | "MAIL"              -> MAIL
  | "CALCULATOR"        -> CALCULATOR
  | "COMPUTER"          -> COMPUTER
  | "AC_SEARCH"         -> AC_SEARCH
  | "AC_HOME"           -> AC_HOME
  | "AC_BACK"           -> AC_BACK
  | "AC_FORWARD"        -> AC_FORWARD
  | "AC_STOP"           -> AC_STOP
  | "AC_REFRESH"        -> AC_REFRESH
  | "AC_BOOKMARKS"      -> AC_BOOKMARKS
  | "BRIGHTNESSDOWN"    -> BRIGHTNESSDOWN
  | "BRIGHTNESSUP"      -> BRIGHTNESSUP
  | "DISPLAYSWITCH"     -> DISPLAYSWITCH
  | "KBDILLUMTOGGLE"    -> KBDILLUMTOGGLE
  | "KBDILLUMDOWN"      -> KBDILLUMDOWN
  | "KBDILLUMUP"        -> KBDILLUMUP
  | "EJECT"             -> EJECT
  | "SLEEP"             -> SLEEP
  | _ -> invalid_arg "Sdlscancode.of_string"

