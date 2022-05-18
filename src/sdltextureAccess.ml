
type t =
| Static
| Streaming
| Target


let to_string = function
  | Static    -> "SDL_TEXTUREACCESS_STATIC"
  | Streaming -> "SDL_TEXTUREACCESS_STREAMING"
  | Target    -> "SDL_TEXTUREACCESS_TARGET"


let of_string s =
  match String.uppercase_ascii s with
  | "SDL_TEXTUREACCESS_STATIC"    -> Static
  | "SDL_TEXTUREACCESS_STREAMING" -> Streaming
  | "SDL_TEXTUREACCESS_TARGET"    -> Target
  | _ -> invalid_arg "SdltextureAccess.of_string"

