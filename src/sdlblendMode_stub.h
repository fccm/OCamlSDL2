#ifndef _CAML_SDL_BLENDMODE_
#define _CAML_SDL_BLENDMODE_

#include <SDL_blendmode.h>

value Val_SDL_BlendMode(SDL_BlendMode blend_mode);

extern const SDL_BlendMode ocaml_SDL_BlendMode_table[];

#define SDL_BlendMode_val(blend_mode) \
    ocaml_SDL_BlendMode_table[Long_val(blend_mode)]

#endif /* _CAML_SDL_BLENDMODE_ */
