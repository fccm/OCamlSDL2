type t

val create : unit -> t

val is_paused : t -> bool

val get_ticks : t -> int

val pause : t -> unit

val restart : t -> unit

val toggle_pause : t -> unit
