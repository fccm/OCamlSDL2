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

#include <SDL_audio.h>

const SDL_AudioFormat ocaml_SDL_AudioFormat_table[] = {
    AUDIO_U8,
    AUDIO_S8,
    AUDIO_U16LSB,
    AUDIO_S16LSB,
    AUDIO_U16MSB,
    AUDIO_S16MSB,
    AUDIO_U16,
    AUDIO_S16,
    AUDIO_S32LSB,
    AUDIO_S32MSB,
    AUDIO_S32,
    AUDIO_F32LSB,
    AUDIO_F32MSB,
    AUDIO_F32,
    AUDIO_U16SYS,
    AUDIO_S16SYS,
    AUDIO_S32SYS,
    AUDIO_F32SYS
};

value
Val_SDL_AudioFormat(SDL_AudioFormat format)
{
    // commented-out cases are synonyms
    switch (format) {
    case AUDIO_U8: return Val_int(0);
    case AUDIO_S8: return Val_int(1);
    case AUDIO_U16LSB: return Val_int(2);
    case AUDIO_S16LSB: return Val_int(3);
    case AUDIO_U16MSB: return Val_int(4);
    case AUDIO_S16MSB: return Val_int(5);
        // case AUDIO_U16: return Val_int(6);
        // case AUDIO_S16: return Val_int(7);
    case AUDIO_S32LSB: return Val_int(8);
    case AUDIO_S32MSB: return Val_int(9);
        // case AUDIO_S32: return Val_int(10);
    case AUDIO_F32LSB: return Val_int(11);
    case AUDIO_F32MSB: return Val_int(12);
        // case AUDIO_F32: return Val_int(13);
        // case AUDIO_U16SYS: return Val_int(14);
        // case AUDIO_S16SYS: return Val_int(15);
        // case AUDIO_S32SYS: return Val_int(16);
        // case AUDIO_F32SYS: return Val_int(17);
    }
    caml_failwith("SdlAudiFormat.t");
}

CAMLprim value
caml_SDL_GetAudioDrivers(value unit)
{
    CAMLparam0();
    CAMLlocal1(ret);
    int i, num;
    num = SDL_GetNumAudioDrivers();
    ret = caml_alloc(num, 0);
    for (i = 0; i < num; i++) {
        const char *driver = SDL_GetAudioDriver(i);
        Store_field(ret, i, caml_copy_string(driver));
    }
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_AudioInit(value driver_name)
{
    int r = SDL_AudioInit(String_val(driver_name));
    if (r) caml_failwith("Sdlaudio.init");
    return Val_unit;
}

CAMLprim value
caml_SDL_AudioQuit(value unit)
{
    SDL_AudioQuit();
    return Val_unit;
}

CAMLprim value
caml_SDL_GetCurrentAudioDriver(value unit)
{
    const char * dr = SDL_GetCurrentAudioDriver();
    return caml_copy_string(dr);
}

static inline SDL_AudioStatus
SDL_AudioStatus_val(value v)
{
    switch (Int_val(v))
    {
        case 0: return SDL_AUDIO_STOPPED;
        case 1: return SDL_AUDIO_PLAYING;
        case 2: return SDL_AUDIO_PAUSED;
        default: caml_failwith("Sdlaudio.status");
    }
    caml_failwith("Sdlaudio.status");
}

static inline value
Val_SDL_AudioStatus(SDL_AudioStatus st)
{
    switch (st)
    {
        case SDL_AUDIO_STOPPED: return Val_int(0);
        case SDL_AUDIO_PLAYING: return Val_int(1);
        case SDL_AUDIO_PAUSED:  return Val_int(2);
        default: caml_failwith("Sdlaudio.status");
    }
    caml_failwith("Sdlaudio.status");
}

CAMLprim value
caml_SDL_GetAudioStatus(value unit)
{
    SDL_AudioStatus st = SDL_GetAudioStatus();
    return Val_SDL_AudioStatus(st);
}

CAMLprim value
caml_SDL_PauseAudio(value pause_on)
{
    SDL_PauseAudio(Bool_val(pause_on));
    return Val_unit;
}

CAMLprim value
caml_SDL_LockAudio(value unit)
{
    SDL_LockAudio();
    return Val_unit;
}

CAMLprim value
caml_SDL_UnlockAudio(value unit)
{
    SDL_UnlockAudio();
    return Val_unit;
}

CAMLprim value
caml_SDL_CloseAudio(value unit)
{
    SDL_CloseAudio();
    return Val_unit;
}

static value Val_SDL_AudioSpec(SDL_AudioSpec * p)
{
    return caml_copy_nativeint((intnat) p);
}

static SDL_AudioSpec * SDL_AudioSpec_val(value v)
{
    return (SDL_AudioSpec *) Nativeint_val(v);
}

CAMLprim value
caml_SDL_alloc_audio_spec(value unit)
{
    SDL_AudioSpec *audio_spec;
    audio_spec = malloc(sizeof(SDL_AudioSpec));
    return Val_SDL_AudioSpec(audio_spec);
}

CAMLprim value
caml_SDL_free_audio_spec(value audio_spec)
{
    free(SDL_AudioSpec_val(audio_spec));
    return Val_unit;
}

CAMLprim value
caml_SDL_LoadWAV(
        value filename,
        value audio_spec)
{
    CAMLparam2(filename, audio_spec);
    CAMLlocal1(ret);
    Uint8 *audio_buf;
    Uint32 audio_len;
    if (SDL_LoadWAV(String_val(filename),
            SDL_AudioSpec_val(audio_spec),
            &audio_buf,
            &audio_len) == NULL) {
        caml_failwith("Sdlaudio.load_wav");
    }
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, ((value)audio_buf));
    Store_field(ret, 1, caml_copy_int32(audio_len));
    CAMLreturn(ret);
}

CAMLprim value
caml_SDL_FreeWAV(value audio_buf)
{
    SDL_FreeWAV((Uint8 *) audio_buf);
    return Val_unit;
}

#define Val_SDL_AudioDeviceID caml_copy_int32
#define SDL_AudioDeviceID_val Int32_val

CAMLprim value
caml_SDL_OpenAudioDevice_simple(value spec)
{
    SDL_AudioDeviceID deviceId =
        SDL_OpenAudioDevice(
                NULL, 0, SDL_AudioSpec_val(spec), NULL, 0);
    if (deviceId == 0)
        caml_failwith("Sdlaudio.open_audio_device_simple");
    return Val_SDL_AudioDeviceID(deviceId);
}

CAMLprim value
caml_SDL_QueueAudio(value dev, value data, value len)
{
    int success =
        SDL_QueueAudio(
                SDL_AudioDeviceID_val(dev),
                (void *)data,
                (Uint32)Int32_val(len));
    if (success != 0)
        caml_failwith("Sdlaudio.queue_audio");
    return Val_unit;
}

CAMLprim value
caml_SDL_UnpauseAudioDevice(value dev)
{
    int pause_on = 0;
    SDL_PauseAudioDevice(
            SDL_AudioDeviceID_val(dev),
            pause_on);
    return Val_unit;
}

CAMLprim value
caml_SDL_PauseAudioDevice(value dev)
{
    int pause_on = 1;
    SDL_PauseAudioDevice(
            SDL_AudioDeviceID_val(dev),
            pause_on);
    return Val_unit;
}

CAMLprim value
caml_SDL_CloseAudioDevice(value dev)
{
    SDL_CloseAudioDevice(SDL_AudioDeviceID_val(dev));
    return Val_unit;
}

#if 0
int
SDL_OpenAudio(
            SDL_AudioSpec * desired,
            SDL_AudioSpec * obtained);

int SDL_GetNumAudioDevices(int iscapture);
const char *
SDL_GetAudioDeviceName(
            int index,
            int iscapture);

SDL_AudioDeviceID
SDL_OpenAudioDevice(
            const char *device,
            int iscapture,
            const SDL_AudioSpec * desired,
            SDL_AudioSpec * obtained,
            int allowed_changes);

SDL_AudioStatus
SDL_GetAudioDeviceStatus(SDL_AudioDeviceID dev);
SDL_AudioSpec *
SDL_LoadWAV_RW(
            SDL_RWops * src,
            int freesrc,
            SDL_AudioSpec * spec,
            Uint8 ** audio_buf,
            Uint32 * audio_len);

#define SDL_LoadWAV(file, spec, audio_buf, audio_len) \
	SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"),1, spec,audio_buf,audio_len)


int
SDL_BuildAudioCVT(
            SDL_AudioCVT * cvt,
            SDL_AudioFormat src_format,
            Uint8 src_channels,
            int src_rate,
            SDL_AudioFormat dst_format,
            Uint8 dst_channels,
            int dst_rate);

int SDL_ConvertAudio(SDL_AudioCVT * cvt);

#define SDL_MIX_MAXVOLUME 128
void
SDL_MixAudio(
            Uint8 * dst, const Uint8 * src,
            Uint32 len, int volume);

void
SDL_MixAudioFormat(
            Uint8 * dst,
            const Uint8 * src,
            SDL_AudioFormat format,
            Uint32 len, int volume);

void SDL_LockAudioDevice(SDL_AudioDeviceID dev);
void SDL_UnlockAudioDevice(SDL_AudioDeviceID dev);
int SDL_AudioDeviceConnected(SDL_AudioDeviceID dev);

#endif

/* vim: set ts=4 sw=4 et: */
/* Local Variables: */
/* c-basic-offset:4; tab-width:4; indent-tabs-mode:nil; */
/* End: */
