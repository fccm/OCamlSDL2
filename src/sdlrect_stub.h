#ifndef _CAML_SDL_RECT_
#define _CAML_SDL_RECT_

#define SDL_Rect_val(r, v) \
    (r)->x = Int_val(Field(v, 0)); \
    (r)->y = Int_val(Field(v, 1)); \
    (r)->w = Int_val(Field(v, 2)); \
    (r)->h = Int_val(Field(v, 3))

#define Val_SDL_Rect(ret, r) \
    ret = caml_alloc(4, 0); \
    Store_field(ret, 0, Val_int((r)->x)); \
    Store_field(ret, 1, Val_int((r)->y)); \
    Store_field(ret, 2, Val_int((r)->w)); \
    Store_field(ret, 3, Val_int((r)->h))

#endif /* _CAML_SDL_RECT_ */
