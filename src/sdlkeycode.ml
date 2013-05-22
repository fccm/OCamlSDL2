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
  | BRIGHTNESSDOWN
  | BRIGHTNESSUP
  | DISPLAYSWITCH
  | KBDILLUMTOGGLE
  | KBDILLUMDOWN
  | KBDILLUMUP
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
  | BRIGHTNESSDOWN      -> "BRIGHTNESSDOWN"
  | BRIGHTNESSUP        -> "BRIGHTNESSUP"
  | DISPLAYSWITCH       -> "DISPLAYSWITCH"
  | KBDILLUMTOGGLE      -> "KBDILLUMTOGGLE"
  | KBDILLUMDOWN        -> "KBDILLUMDOWN"
  | KBDILLUMUP          -> "KBDILLUMUP"
  | Eject               -> "Eject"
  | Sleep               -> "Sleep"
