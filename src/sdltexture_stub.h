#ifndef _CAML_SDL_TEXTURE_
#define _CAML_SDL_TEXTURE_

static value Val_SDL_Texture(SDL_Texture * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_Texture * SDL_Texture_val(value v)
{
    return (SDL_Texture *) Nativeint_val(v);
}

#endif /* _CAML_SDL_TEXTURE_ */
