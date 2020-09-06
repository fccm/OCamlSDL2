#ifndef _CAML_SDL_RENDERER_
#define _CAML_SDL_RENDERER_

static value Val_SDL_Renderer(SDL_Renderer * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_Renderer * SDL_Renderer_val(value v)
{
    return (SDL_Renderer *) Nativeint_val(v);
}

#endif /* _CAML_SDL_RENDERER_ */
