#ifndef _CAML_SDL_window_
#define _CAML_SDL_window_

#define SDL_Window_val(win)  ((SDL_Window *)(win))
#define Val_SDL_Window(win)  ((value)(win))

Uint32 Val_SDL_WindowFlags(value mask_list);

#endif /* _CAML_SDL_window_ */
