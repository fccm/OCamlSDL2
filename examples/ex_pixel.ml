open Sdl

let test_rgb () =
  let fmt = Pixel.PixelFormat_RGB888 in
  Printf.printf "Using pixel format: %s\n"
    (Pixel.get_pixel_format_name fmt);
  let pixel_format = Pixel.alloc_format fmt in
  let rgb = (255, 128, 0) in
  let color = Pixel.map_RGB pixel_format rgb in
  Printf.printf "pixel binary data: 0x%06lX\n" color;
  let r, g, b = Pixel.get_RGB color pixel_format in
  Printf.printf "color RGB values: %d %d %d\n" r g b;
  Pixel.free_format pixel_format;
;;

let test_rgba () =
  let fmt = Pixel.PixelFormat_RGBA8888 in
  Printf.printf "Using pixel format: %s\n"
    (Pixel.get_pixel_format_name fmt);
  let pixel_format = Pixel.alloc_format fmt in
  let rgba = (255, 128, 0, 96) in
  let color = Pixel.map_RGBA pixel_format rgba in
  Printf.printf "pixel binary data: 0x%08lX\n" color;
  let r, g, b, a = Pixel.get_RGBA color pixel_format in
  Printf.printf "color RGBA values: %d %d %d %d\n" r g b a;
  Pixel.free_format pixel_format;
;;

let () = test_rgba ()
