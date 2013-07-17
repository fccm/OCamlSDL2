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
#include "sdlpoint_stub.h"

#define Val_none Val_int(0)
#define Some_val(v) Field(v,0)

CAMLprim value
caml_SDL_CreateWindowAndRenderer(
        value width, value height, value _window_flags)
{
    CAMLparam2(width, height);
    CAMLlocal1(ret);

    SDL_Window *window;
    SDL_Renderer *renderer;
    Uint32 window_flags =
        Val_SDL_WindowFlags(_window_flags);

    int r = SDL_CreateWindowAndRenderer(
        Int_val(width), Int_val(height), window_flags, &window, &renderer);

    if (r)
        caml_failwith("Sdlrender.create_window_and_renderer");

    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_SDL_Window(window));
    Store_field(ret, 1, Val_SDL_Renderer(renderer));
    CAMLreturn(ret);
}

static const SDL_RendererFlags SDL_RendererFlags_table[] = {
    SDL_RENDERER_SOFTWARE,
    SDL_RENDERER_ACCELERATED,
    SDL_RENDERER_PRESENTVSYNC,
    SDL_RENDERER_TARGETTEXTURE,
};

static inline Uint32
SDL_RendererFlags_val(value flag_list)
{
    int c_mask = 0; 
    while (flag_list != Val_emptylist)
    {
        value head = Field(flag_list, 0);
        c_mask |= SDL_RendererFlags_table[Long_val(head)];
        flag_list = Field(flag_list, 1);
    }
    return c_mask;
}

CAMLprim value
caml_SDL_CreateRenderer(value window, value index, value _flags)
{
    Uint32 flags = SDL_RendererFlags_val(_flags);

    SDL_Renderer * rend =
        SDL_CreateRenderer(
            SDL_Window_val(window),
            Int_val(index),
            flags);

    if (rend == NULL)
        caml_failwith("Sdlrender.create_renderer");

    return Val_SDL_Renderer(rend);
}

CAMLprim value
caml_SDL_RenderSetLogicalSize(value renderer, value dims)
{
    value w = Field(dims,0);
    value h = Field(dims,1);
    int r = SDL_RenderSetLogicalSize(
                SDL_Renderer_val(renderer),
                Int_val(w), Int_val(h));
    if (r) caml_failwith("Sdlrender.set_logical_size");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderSetLogicalSize2(value renderer, value w, value h)
{
    int r = SDL_RenderSetLogicalSize(
                SDL_Renderer_val(renderer),
                Int_val(w), Int_val(h));
    if (r) caml_failwith("Sdlrender.set_logical_size2");
    return Val_unit;
}

#define Uint8_val Int_val
CAMLprim value
caml_SDL_SetRenderDrawColor(
        value renderer, value rgb, value a)
{
    int s = SDL_SetRenderDrawColor(
        SDL_Renderer_val(renderer),
        Uint8_val(Field(rgb, 0)),
        Uint8_val(Field(rgb, 1)),
        Uint8_val(Field(rgb, 2)),
        Uint8_val(a));
    if (s) caml_failwith("Sdlrender.draw_color");
    return Val_unit;
}

CAMLprim value
caml_SDL_SetRenderDrawColor3(
        value renderer, value r, value g, value b, value a)
{
    int s = SDL_SetRenderDrawColor(
        SDL_Renderer_val(renderer),
        Uint8_val(r), Uint8_val(g), Uint8_val(b), Uint8_val(a));
    if (s) caml_failwith("Sdlrender.draw_color3");
    return Val_unit;
}
#undef Uint8_val

CAMLprim value
caml_SDL_RenderDrawPoint(value renderer, value p)
{
    int r = SDL_RenderDrawPoint(
                SDL_Renderer_val(renderer),
                Int_val(Field(p, 0)),
                Int_val(Field(p, 1)));
    if (r) caml_failwith("Sdlrender.draw_point");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawPoint2(value renderer, value x, value y)
{
    int r = SDL_RenderDrawPoint(
                SDL_Renderer_val(renderer),
                Int_val(x), Int_val(y));
    if (r) caml_failwith("Sdlrender.draw_point2");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawPoints(value renderer, value ml_points)
{
    unsigned int i;
    unsigned int count = Wosize_val(ml_points);
    SDL_Point * points = malloc(count * sizeof(SDL_Point));
    for (i = 0; i < count; i++) {
        value p = Field(ml_points, i);
        points[i].x = Int_val(Field(p, 0));
        points[i].y = Int_val(Field(p, 1));
    }
    int r = SDL_RenderDrawPoints(
                SDL_Renderer_val(renderer),
                points, count);
    free(points);
    if (r) caml_failwith("Sdlrender.draw_points");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawLine(value renderer, value line)
{
    value p1 = Field(line, 0);
    value p2 = Field(line, 1);
    int r = SDL_RenderDrawLine(
                SDL_Renderer_val(renderer),
                Int_val(Field(p1, 0)),
                Int_val(Field(p1, 1)),
                Int_val(Field(p2, 0)),
                Int_val(Field(p2, 1)));
    if (r) caml_failwith("Sdlrender.draw_line");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawLine2(value renderer, value p1, value p2)
{
    int r = SDL_RenderDrawLine(
                SDL_Renderer_val(renderer),
                Int_val(Field(p1, 0)),
                Int_val(Field(p1, 1)),
                Int_val(Field(p2, 0)),
                Int_val(Field(p2, 1)));
    if (r) caml_failwith("Sdlrender.draw_line");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawLines(value renderer, value ml_points)
{
    unsigned int i;
    unsigned int count = Wosize_val(ml_points);
    SDL_Point * points = malloc(count * sizeof(SDL_Point));
    for (i = 0; i < count; i++) {
        value p = Field(ml_points, i);
        points[i].x = Int_val(Field(p, 0));
        points[i].y = Int_val(Field(p, 1));
    }
    int r = SDL_RenderDrawLines(
                SDL_Renderer_val(renderer),
                points, count);
    free(points);
    if (r) caml_failwith("Sdlrender.draw_lines");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderDrawRect(value renderer, value _rect)
{
    SDL_Rect rect;
    SDL_Rect_val(&rect, _rect);
    int r = SDL_RenderDrawRect(
                SDL_Renderer_val(renderer),
                &rect);
    if (r) caml_failwith("Sdlrender.draw_rect");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderFillRect(value renderer, value _rect)
{
    SDL_Rect rect;
    SDL_Rect_val(&rect, _rect);
    int r = SDL_RenderFillRect(
                SDL_Renderer_val(renderer),
                &rect);
    if (r) caml_failwith("Sdlrender.fill_rect");
    return Val_unit;
}

CAMLprim value
caml_SDL_RenderCopy(
        value renderer,
        value texture,
        value _srcrect,
        value _dstrect,
        value unit)
{
    SDL_Rect srcrect;
    SDL_Rect dstrect;

    SDL_Rect *srcrect_;
    SDL_Rect *dstrect_;

    if (_srcrect == Val_none) {
        srcrect_ = NULL;
    } else {
        SDL_Rect_val(&srcrect, Some_val(_srcrect));
        srcrect_ = &srcrect;
    }

    if (_dstrect == Val_none) {
        dstrect_ = NULL;
    } else {
        SDL_Rect_val(&dstrect, Some_val(_dstrect));
        dstrect_ = &dstrect;
    }

    int r = SDL_RenderCopy(
                SDL_Renderer_val(renderer),
                SDL_Texture_val(texture),
                srcrect_,
                dstrect_);

    if (r)
        caml_failwith("Sdlrender.copy");

    return Val_unit;
}


static const SDL_RendererFlip sdl_rendererflip_table[] = {
    SDL_FLIP_NONE,
    SDL_FLIP_HORIZONTAL,
    SDL_FLIP_VERTICAL,
};

#define SDL_RendererFlip_val(v) \
    sdl_rendererflip_table[Long_val(v)]

CAMLprim value
caml_SDL_RenderCopyEx(
        value renderer,
        value texture,
        value _srcrect,
        value _dstrect,
        value angle,
        value _center,
        value flip,
        value unit)
{
    SDL_Rect srcrect;
    SDL_Rect *srcrect_;

    SDL_Rect dstrect;
    SDL_Rect *dstrect_;

    SDL_Point center;
    SDL_Point *center_;

    double angle_;
    SDL_RendererFlip flip_;

    if (_srcrect == Val_none) {
        srcrect_ = NULL;
    } else {
        SDL_Rect_val(&srcrect, Some_val(_srcrect));
        srcrect_ = &srcrect;
    }

    if (_dstrect == Val_none) {
        dstrect_ = NULL;
    } else {
        SDL_Rect_val(&dstrect, Some_val(_dstrect));
        dstrect_ = &dstrect;
    }

    if (_center == Val_none) {
        center_ = NULL;
    } else {
        SDL_Point_val(&center, Some_val(_center));
        center_ = &center;
    }

    angle_ =
        (angle == Val_none
        ? 0.0
        : Double_val(Some_val(angle))
        );

    flip_ =
        (flip == Val_none
        ? SDL_FLIP_NONE
        : SDL_RendererFlip_val(Some_val(flip))
        );

    int r =
        SDL_RenderCopyEx(
                SDL_Renderer_val(renderer),
                SDL_Texture_val(texture),
                srcrect_,
                dstrect_,
                angle_,
                center_,
                flip_);

    if (r)
        caml_failwith("Sdlrender.copyEx");

    return Val_unit;
}

CAMLprim value
caml_SDL_RenderCopyEx_bc(value * argv, int argn)
{
    return caml_SDL_RenderCopyEx(
        argv[0], argv[1], argv[2], argv[3],
        argv[4], argv[5], argv[6], argv[7]);
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
