#ifndef _CAML_SDL_AUDIO_
#define _CAML_SDL_AUDIO_

#include <SDL_audio.h>

value Val_SDL_AudioFormat(SDL_AudioFormat format);

extern const SDL_AudioFormat ocaml_SDL_AudioFormat_table[];

#define SDL_AudioFormat_val(format) \
    ocaml_SDL_AudioFormat_table[Long_val(format)]

#endif /* _CAML_SDL_AUDIO_ */
