open Sdl
open Sdlba

let color_of_rgb ~surf ~rgb =
  let fmt_kind = Surface.get_pixelformat_t surf in
  let fmt = Pixel.alloc_format fmt_kind in
  let color = Pixel.map_RGB fmt ~rgb in
  Pixel.free_format fmt;
  (color)

let fill_rect surf x y w h ~rgb =
  let color = color_of_rgb ~surf ~rgb in
  let rect = Rect.make4 x y w h in
  Surface.fill_rect ~dst:surf ~rect ~color;
;;

let output_ppm ~oc ~img ~width ~height =
  Printf.fprintf oc "P6\n%d %d\n255\n" width height;
  let n = Bigarray.Array1.dim img in
  for i = 0 to pred n do
    output_char oc (char_of_int img.{i});
  done;
  output_char oc '\n';
  flush oc;
;;

let () =
  Sdl.init [`VIDEO];
  let width, height = (320, 240) in
  let surf = Surface.create_rgb ~width ~height ~depth:24 in

  fill_rect surf  0  0 320 240 ~rgb:(0,0,0);
  fill_rect surf 20 20 200 120 ~rgb:(0,255,0);
  fill_rect surf 60 60 200 140 ~rgb:(255,0,0);
  fill_rect surf  0  0 100 100 ~rgb:(0,0,255);

  let ba = Surface_ba.get_pixels surf in

  let oc = open_out "test_surf_ba.ppm" in
  output_ppm ~oc ~img:ba ~width ~height;
  close_out oc;

  Sdl.quit ()
