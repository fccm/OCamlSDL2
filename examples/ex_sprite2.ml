open Sdl

let proc_events = function
  | Event.KeyDown { keycode = Keycode.Q; _ }
  | Event.KeyDown { keycode = Keycode.Escape; _ }
  | Event.Quit _ -> Sdl.quit (); exit 0
  | _ -> ()


let rec event_loop () =
  match Event.poll_event () with
  | None -> ()
  | Some ev ->
      proc_events ev;
      event_loop ()


let pixel_for_surface ~surface ~rgb =
  let fmt = Surface.get_pixelformat_t surface in
  let pixel_format = Pixel.alloc_format fmt in
  let pixel = Pixel.map_RGB pixel_format rgb in
  Pixel.free_format pixel_format;
  (pixel)


let load_sprite renderer ~filename =
  let surface = Surface.load_bmp ~filename in
  let rgb = (255, 255, 255) in
  let key = pixel_for_surface ~surface ~rgb in
  Surface.set_color_key surface ~enable:true ~key;
  let tex = Texture.create_from_surface renderer surface in
  Surface.free surface;
  (tex)


let () =
  let width, height = (320, 240) in
  Sdl.init [`VIDEO];
  let window, render =
    Render.create_window_and_renderer ~width ~height ~flags:[]
  in
  let filename = "../../minigames-assets/" ^
                 "redshrike-shipsheetparts/shipsheetparts.bmp" in
  let texture = load_sprite render ~filename in

  let src_rect = Rect.make4 20 14 43 33 in
  let dst_rect = Rect.make4 80 80 43 33 in

  let render () =
    Render.set_draw_color render (100, 100, 100) 255;
    Render.clear render;

    Render.copy render ~texture ~src_rect ~dst_rect ();

    Render.copyEx render ~texture
        ~src_rect
        ~dst_rect:{ dst_rect with x = 140 }
        ~angle:90.0
        (*~center:(0, 0)*)
        (*~flip:Render.Flip_Vertical*) ();

    Render.render_present render;
  in

  let rec main_loop () =
    event_loop ();
    render ();
    Timer.delay 60;
    main_loop ()
  in
  main_loop ()
