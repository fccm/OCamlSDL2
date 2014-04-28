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

#include <SDL_video.h>
#include "sdlwindow_stub.h"
#include "sdlsurface_stub.h"
#include "sdlrect_stub.h"

/*
typedef struct
{
    Uint32 format;
    int w;
    int h;
    int refresh_rate;
    void *driverdata;
} SDL_DisplayMode;

typedef struct SDL_Window SDL_Window;

typedef enum
{
    SDL_WINDOW_FULLSCREEN   = 0x00000001,
    SDL_WINDOW_OPENGL       = 0x00000002,
    SDL_WINDOW_SHOWN        = 0x00000004,
    SDL_WINDOW_HIDDEN       = 0x00000008,
    SDL_WINDOW_BORDERLESS   = 0x00000010,
    SDL_WINDOW_RESIZABLE    = 0x00000020,
    SDL_WINDOW_MINIMIZED    = 0x00000040,
    SDL_WINDOW_MAXIMIZED    = 0x00000080,
    SDL_WINDOW_INPUT_GRABBED= 0x00000100,
    SDL_WINDOW_INPUT_FOCUS  = 0x00000200,
    SDL_WINDOW_MOUSE_FOCUS  = 0x00000400,
	SDL_WINDOW_FULLSCREEN_DESKTOP = ( SDL_WINDOW_FULLSCREEN | 0x00001000 ),
    SDL_WINDOW_FOREIGN      = 0x00000800
} SDL_WindowFlags;

#define SDL_WINDOWPOS_UNDEFINED_MASK    0x1FFF0000
#define SDL_WINDOWPOS_UNDEFINED_DISPLAY(X)  (SDL_WINDOWPOS_UNDEFINED_MASK|(X))
#define SDL_WINDOWPOS_UNDEFINED         SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
#define SDL_WINDOWPOS_ISUNDEFINED(X)    \
            (((X)&0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK)

#define SDL_WINDOWPOS_CENTERED_MASK    0x2FFF0000
#define SDL_WINDOWPOS_CENTERED_DISPLAY(X)  (SDL_WINDOWPOS_CENTERED_MASK|(X))
#define SDL_WINDOWPOS_CENTERED         SDL_WINDOWPOS_CENTERED_DISPLAY(0)
#define SDL_WINDOWPOS_ISCENTERED(X)    \
            (((X)&0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK)

typedef enum
{
    SDL_WINDOWEVENT_NONE,        
    SDL_WINDOWEVENT_SHOWN,       
    SDL_WINDOWEVENT_HIDDEN,      
    SDL_WINDOWEVENT_EXPOSED,     
    SDL_WINDOWEVENT_MOVED,       
    SDL_WINDOWEVENT_RESIZED,     
    SDL_WINDOWEVENT_SIZE_CHANGED,
    SDL_WINDOWEVENT_MINIMIZED,   
    SDL_WINDOWEVENT_MAXIMIZED,   
    SDL_WINDOWEVENT_RESTORED,    
    SDL_WINDOWEVENT_ENTER,       
    SDL_WINDOWEVENT_LEAVE,       
    SDL_WINDOWEVENT_FOCUS_GAINED,
    SDL_WINDOWEVENT_FOCUS_LOST,  
    SDL_WINDOWEVENT_CLOSE        
                                 
} SDL_WindowEventID;

typedef void *SDL_GLContext;

typedef enum
{
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_RETAINED_BACKING,
    SDL_GL_CONTEXT_MAJOR_VERSION,
    SDL_GL_CONTEXT_MINOR_VERSION,
    SDL_GL_CONTEXT_EGL,
    SDL_GL_CONTEXT_FLAGS,
    SDL_GL_CONTEXT_PROFILE_MASK,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT
} SDL_GLattr;

typedef enum
{
    SDL_GL_CONTEXT_PROFILE_CORE           = 0x0001,
    SDL_GL_CONTEXT_PROFILE_COMPATIBILITY  = 0x0002,
    SDL_GL_CONTEXT_PROFILE_ES             = 0x0004
} SDL_GLprofile;

typedef enum
{
    SDL_GL_CONTEXT_DEBUG_FLAG              = 0x0001,
    SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
    SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004,
    SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    = 0x0008
} SDL_GLcontextFlag;


int SDL_GetNumVideoDrivers(void);

const char * SDL_GetVideoDriver(int index);

int SDL_VideoInit(const char *driver_name);

void SDL_VideoQuit(void);

const char * SDL_GetCurrentVideoDriver(void);

int SDL_GetNumVideoDisplays(void);

const char * SDL_GetDisplayName(int displayIndex);

int SDL_GetDisplayBounds(int displayIndex, SDL_Rect * rect);

int SDL_GetNumDisplayModes(int displayIndex);

int
SDL_GetDisplayMode(
            int displayIndex,
            int modeIndex,
            SDL_DisplayMode * mode);

int
SDL_GetDesktopDisplayMode(
            int displayIndex,
            SDL_DisplayMode * mode);

int
SDL_GetCurrentDisplayMode(
            int displayIndex,
            SDL_DisplayMode * mode);

SDL_DisplayMode *
SDL_GetClosestDisplayMode(
            int displayIndex,
            const SDL_DisplayMode * mode,
            SDL_DisplayMode * closest);

int SDL_GetWindowDisplayIndex(SDL_Window * window);

int
SDL_SetWindowDisplayMode(
            SDL_Window * window,
            const SDL_DisplayMode * mode);

int
SDL_GetWindowDisplayMode(
            SDL_Window * window,
            SDL_DisplayMode * mode);

Uint32 SDL_GetWindowPixelFormat(SDL_Window * window);

*/

static const Uint32 caml_sdl_windowflags_table[] = {
    SDL_WINDOW_FULLSCREEN,
    SDL_WINDOW_OPENGL,
    SDL_WINDOW_SHOWN,
    SDL_WINDOW_HIDDEN,
    SDL_WINDOW_BORDERLESS,
    SDL_WINDOW_RESIZABLE,
    SDL_WINDOW_MINIMIZED,
    SDL_WINDOW_MAXIMIZED,
    SDL_WINDOW_INPUT_GRABBED,
    SDL_WINDOW_INPUT_FOCUS,
    SDL_WINDOW_MOUSE_FOCUS,
    SDL_WINDOW_FULLSCREEN_DESKTOP,
    SDL_WINDOW_FOREIGN,
};

Uint32
Val_SDL_WindowFlags(value mask_list)
{
    Uint32 c_mask = 0x00000000;
    while (mask_list != Val_emptylist)
    {
        value head = Field(mask_list, 0);
        c_mask |= caml_sdl_windowflags_table[Long_val(head)];
        mask_list = Field(mask_list, 1);
    }
    return c_mask;
}

static inline int
caml_SDL_WindowPos(value pos)
{
    if (Is_long(pos))
    {
        if (pos == caml_hash_variant("centered"))
        {
            return SDL_WINDOWPOS_CENTERED;
        } else
        if (pos == caml_hash_variant("undefined"))
        {
            return SDL_WINDOWPOS_UNDEFINED;
        } else
            caml_failwith("Sdlwindow.window_pos");
    }
    else if (Is_block(pos))
    {
        if (Field(pos,0) == caml_hash_variant("pos"))
        {
            return Int_val(Field(pos,1));
        } else
            caml_failwith("Sdlwindow.window_pos");
    } else {
        caml_failwith("Sdlwindow.window_pos");
    }
}

CAMLprim value
caml_SDL_CreateWindow(
        value title,
        value pos,
        value dims,
        value flags)
{
    int _x = caml_SDL_WindowPos(Field(pos,0));
    int _y = caml_SDL_WindowPos(Field(pos,1));

    SDL_Window *win =
        SDL_CreateWindow(
                String_val(title),
                _x, _y,
                Int_val(Field(dims,0)),
                Int_val(Field(dims,1)),
                Val_SDL_WindowFlags(flags));

    if (win == NULL)
        caml_failwith("Sdlwindow.create");

    return Val_SDL_Window(win);
}

CAMLprim value
caml_SDL_CreateWindow2(
        value title,
        value x, value y,
        value w, value h,
        value flags)
{
    int _x = caml_SDL_WindowPos(x);
    int _y = caml_SDL_WindowPos(y);

    SDL_Window *win =
        SDL_CreateWindow(
                String_val(title),
                _x, _y,
                Int_val(w), Int_val(h),
                Val_SDL_WindowFlags(flags));

    if (win == NULL)
        caml_failwith("Sdlwindow.create2");

    return Val_SDL_Window(win);
}

CAMLprim value
caml_SDL_CreateWindow2_bc(value * argv, int argn)
{
    return caml_SDL_CreateWindow2(
                argv[0], argv[1], argv[2],
                argv[3], argv[4], argv[5]);
}

/*
SDL_Window * SDL_CreateWindowFrom(const void *data);

Uint32 SDL_GetWindowID(SDL_Window * window);

SDL_Window * SDL_GetWindowFromID(Uint32 id);

Uint32 SDL_GetWindowFlags(SDL_Window * window);
*/

CAMLprim value
caml_SDL_SetWindowTitle(value window, value title)
{
    SDL_SetWindowTitle(
            SDL_Window_val(window),
            String_val(title));
    return Val_unit;
}

/*
const char * SDL_GetWindowTitle(SDL_Window * window);

void
SDL_SetWindowIcon(
            SDL_Window * window,
            SDL_Surface * icon);

void*
SDL_SetWindowData(
            SDL_Window * window,
            const char *name,
            void *userdata);

void *
SDL_GetWindowData(
            SDL_Window * window,
            const char *name);

void
SDL_SetWindowPosition(
            SDL_Window * window,
            int x, int y);

void
SDL_GetWindowPosition(
            SDL_Window * window,
            int *x, int *y);

void
SDL_SetWindowSize(
            SDL_Window * window,
            int w, int h);

*/

CAMLprim value
caml_SDL_GetWindowSize(value window)
{
    CAMLlocal1(ret);

    int w, h;
    SDL_GetWindowSize(SDL_Window_val(window), &w, &h);

    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(w));
    Store_field(ret, 1, Val_int(h));
    CAMLreturn(ret);
}

/*
void
SDL_SetWindowMinimumSize(
            SDL_Window * window,
            int min_w,
            int min_h);
    
void
SDL_GetWindowMinimumSize(
            SDL_Window * window,
            int *w,
            int *h);

void
SDL_SetWindowMaximumSize(
            SDL_Window * window,
            int max_w,
            int max_h);
    
void
SDL_GetWindowMaximumSize(SDL_Window * window, int *w, int *h);

void
SDL_SetWindowBordered(
            SDL_Window * window,
            SDL_bool bordered);
*/

CAMLprim value
caml_SDL_ShowWindow(value window)
{
    SDL_ShowWindow(SDL_Window_val(window));
    return Val_unit;
}

CAMLprim value
caml_SDL_HideWindow(value window)
{
    SDL_HideWindow(SDL_Window_val(window));
    return Val_unit;
}

CAMLprim value
caml_SDL_RaiseWindow(value window)
{
    SDL_RaiseWindow(SDL_Window_val(window));
    return Val_unit;
}

CAMLprim value
caml_SDL_MaximizeWindow(value window)
{
    SDL_MaximizeWindow(SDL_Window_val(window));
    return Val_unit;
}

CAMLprim value
caml_SDL_MinimizeWindow(value window)
{
    SDL_MinimizeWindow(SDL_Window_val(window));
    return Val_unit;
}

CAMLprim value
caml_SDL_RestoreWindow(value window)
{
    SDL_RestoreWindow(SDL_Window_val(window));
    return Val_unit;
}

/* TODO:
int SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags);
*/

CAMLprim value
caml_SDL_GetWindowSurface(value window)
{
    SDL_Surface *surf =
        SDL_GetWindowSurface(SDL_Window_val(window));
    return Val_SDL_Surface(surf);
}

CAMLprim value
caml_SDL_UpdateWindowSurface(value window)
{
    int r = SDL_UpdateWindowSurface(SDL_Window_val(window));
    if (r) caml_failwith("Sdlwindow.update_surface");
    return Val_unit;
}

/*
int SDL_UpdateWindowSurfaceRects(
      SDL_Window * window, SDL_Rect * rects, int numrects);

void SDL_SetWindowGrab(SDL_Window * window, SDL_bool grabbed);

SDL_bool SDL_GetWindowGrab(SDL_Window * window);

int SDL_SetWindowBrightness(SDL_Window * window, float brightness);

float SDL_GetWindowBrightness(SDL_Window * window);

int SDL_SetWindowGammaRamp(
      SDL_Window * window,
      const Uint16 * red,
      const Uint16 * green,
      const Uint16 * blue);

int SDL_GetWindowGammaRamp(
      SDL_Window * window,
      Uint16 * red,
      Uint16 * green,
      Uint16 * blue);
*/

CAMLprim value
caml_SDL_DestroyWindow(value window)
{
    SDL_DestroyWindow(SDL_Window_val(window));
    return Val_unit;
}

/*
SDL_bool SDL_IsScreenSaverEnabled(void);

void SDL_EnableScreenSaver(void);

void SDL_DisableScreenSaver(void);
*/

/* vim: set ts=4 sw=4 et: */
