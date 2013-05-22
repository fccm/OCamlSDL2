#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/alloc.h>

#include <SDL_platform.h>

CAMLprim value
caml_SDL_GetPlatform(value unit)
{
    const char *platform_name = SDL_GetPlatform();
    return caml_copy_string(platform_name);
}
