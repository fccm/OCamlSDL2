/* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*/
#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>

#include <SDL_render.h>
#include "sdlrender_stub.h"
#include "sdlwindow_stub.h"
#include "sdltexture_stub.h"
#include "sdlrect_stub.h"

CAMLprim value
caml_SDL_CreateWindowAndRenderer(value width, value height)
{
    CAMLparam2(width, height);
    CAMLlocal1(ret);

    SDL_Window *window;
    SDL_Renderer *renderer;
    Uint32 window_flags = 0;

    int r = SDL_CreateWindowAndRenderer(
        Int_val(width), Int_val(height), window_flags, &window, &renderer);

    if (r)
        caml_failwith("Sdlrender.create_window_and_renderer");

    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_SDL_Window(window));
    Store_field(ret, 1, Val_SDL_Renderer(renderer));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_CreateRenderer(value window, value index, value _flags)
{
    //Uint32 flags = SDL_RENDERER_ACCELERATED;
    SDL_Renderer * rend = SDL_CreateRenderer(
            SDL_Window_val(window), Int_val(index),
            SDL_RENDERER_ACCELERATED);
    if (rend == NULL) caml_failwith("Sdlrender.create_renderer");
    return Val_SDL_Renderer(rend);
}

#define Uint8_val Int_val
CAMLprim value
caml_SDL_SetRenderDrawColor(
        value renderer, value r, value g, value b, value a)
{
    int s = SDL_SetRenderDrawColor(
        SDL_Renderer_val(renderer),
        Uint8_val(r), Uint8_val(g), Uint8_val(b), Uint8_val(a));
    if (s) caml_failwith("Sdlrender.draw_color");
    return Val_unit;
}
#undef Uint8_val

CAMLprim value
caml_SDL_RenderDrawPoint(value renderer, value x, value y)
{
    int r = SDL_RenderDrawPoint(
                SDL_Renderer_val(renderer),
                Int_val(x), Int_val(y));
    if (r) caml_failwith("Sdlrender.draw_point");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderCopy(
        value renderer, value texture,
        value _srcrect, value _dstrect)
{
    SDL_Rect srcrect;
    SDL_Rect dstrect;

    SDL_Rect_val(&srcrect, _srcrect);
    SDL_Rect_val(&dstrect, _dstrect);

    int r = SDL_RenderCopy(
                SDL_Renderer_val(renderer),
                SDL_Texture_val(texture),
                &srcrect, /* TODO: or NULL */
                &dstrect  /* TODO: or NULL */ );
    if (r) caml_failwith("Sdlrender.copy");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderSetScale(value renderer, value scale)
{
    int r = SDL_RenderSetScale(
                SDL_Renderer_val(renderer),
                Double_val(Field(scale,0)),
                Double_val(Field(scale,1)));
    if (r) caml_failwith("Sdlrender.set_scale");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderPresent(value renderer)
{
    SDL_RenderPresent(SDL_Renderer_val(renderer));
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderClear(value renderer)
{
    int r = SDL_RenderClear(SDL_Renderer_val(renderer));
    if (r) caml_failwith("Sdlrender.clear");
    return Val_unit;
}

static value
Val_SDL_RendererInfo(SDL_RendererInfo * info)
{
#if 0
    Uint32 flags;               /**< Supported ::SDL_RendererFlags */
    Uint32 num_texture_formats; /**< The number of available texture formats */
    Uint32 texture_formats[16]; /**< The available texture formats */
#endif
    CAMLparam0();
    CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, caml_copy_string(info->name));
    Store_field(ret, 1, Val_int(info->max_texture_width));
    Store_field(ret, 2, Val_int(info->max_texture_height));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_GetRenderDrivers(value unit)
{
    CAMLparam0();
    CAMLlocal2(ret, dinf);
    unsigned int i, n;
    SDL_RendererInfo info;
    n = SDL_GetNumRenderDrivers();
    ret = caml_alloc(n, 0);
    for (i = 0; i < n; i++) {
        int r = SDL_GetRenderDriverInfo(i, &info);
        if (r) caml_failwith("Sdlrender.get_render_drivers");
        Store_field(ret, i, Val_SDL_RendererInfo(&info));
    }
    CAMLreturn(ret);
}

/* vim: set ts=4 sw=4 et: */
