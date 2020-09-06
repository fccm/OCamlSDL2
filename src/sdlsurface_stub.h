#ifndef _CAML_SDL_SURFACE_
#define _CAML_SDL_SURFACE_

static value Val_SDL_Surface(SDL_Surface * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_Surface * SDL_Surface_val(value v)
{
    return (SDL_Surface *) Nativeint_val(v);
}

#endif /* _CAML_SDL_SURFACE_ */
