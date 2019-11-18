let status = ref 0
let err () = status := 1

let check res should =
  if res = should
  then "OK"
  else (err (); "Failed")

let () =
  let rect1 = Sdlrect.make4 10 10 100  60 in
  let rect2 = Sdlrect.make4 20 20 200 120 in
  let rect3 = Sdlrect.make4 220 220 20 20 in
  let should1, r1 = true,  Sdlrect.has_intersection ~a:rect1 ~b:rect2 in
  let should2, r2 = false, Sdlrect.has_intersection ~a:rect1 ~b:rect3 in
  Printf.printf "test 1: %s\n%!" (check r1 should1);
  Printf.printf "test 2: %s\n%!" (check r2 should2);

  let rect4 = Sdlrect.make4 10 10 20 5 in
  let r3 = Sdlrect.intersect_rect_and_line rect4 (15, 0) (20, 30) in
  let r4 = Sdlrect.intersect_rect_and_line rect4 (50, 0) (60, 40) in
  let should3 = Some (16, 10, 16, 14) in
  let should4 = None in
  Printf.printf "test 3: %s\n%!" (check r3 should3);
  Printf.printf "test 4: %s\n%!" (check r4 should4);

  exit !status
