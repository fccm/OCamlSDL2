#ifndef _CAML_SDL_window_
#define _CAML_SDL_window_

static value Val_SDL_Window(SDL_Window * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_Window * SDL_Window_val(value v)
{
    return (SDL_Window *) Nativeint_val(v);
}

Uint32 Val_SDL_WindowFlags(value mask_list);

#endif /* _CAML_SDL_window_ */
