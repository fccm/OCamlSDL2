#ifndef _CAML_SDL_PIXELFORMAT_
#define _CAML_SDL_PIXELFORMAT_

#include <SDL_pixels.h>

value Val_Sdl_pixelformat_t(Uint32 pixel_format);

extern const Uint32 caml_sdl_pixelformat_table[];
#define Sdl_pixelformat_t(v) \
    caml_sdl_pixelformat_table[Long_val(v)]

#endif /* _CAML_SDL_PIXELFORMAT_ */
