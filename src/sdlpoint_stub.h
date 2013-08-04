#ifndef _CAML_SDL_POINT_
#define _CAML_SDL_POINT_

#define SDL_Point_val(p, v) \
    (p)->x = Int_val(Field(v, 0)); \
    (p)->y = Int_val(Field(v, 1));

#define Val_SDL_Point(ret, p) \
    ret = caml_alloc(2, 0); \
    Store_field(ret, 0, Val_int((p)->x)); \
    Store_field(ret, 1, Val_int((p)->y));

#endif /* _CAML_SDL_POINT_ */
