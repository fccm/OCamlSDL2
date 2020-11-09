(* PausableTimer - A pausable timer for use with OCamlSDL2
 Copyright (C) 2020 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)

type t = {
  mutable t1: int;
  mutable time: int;
  mutable paused: bool
}

let create () = {
    t1 = 0;
    time = 0;
    paused = false;
  }

let is_paused timer =
  timer.paused

let get_ticks timer =
  if timer.paused
  then timer.t1 - timer.time
  else (Sdltimer.get_ticks ()) - timer.time

let pause timer =
  if not timer.paused then begin
    timer.t1 <- Sdltimer.get_ticks ();
    timer.paused <- true;
  end

let restart timer =
  if timer.paused then begin
    let t2 = Sdltimer.get_ticks () in
    timer.time <- timer.time + (t2 - timer.t1);
    timer.paused <- false;
  end

let toggle_pause timer =
  if not timer.paused
  then pause timer
  else restart timer
