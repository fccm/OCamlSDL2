(* example from:
   http://gigi.nullneuron.net/gigilabs/playing-a-wav-file-using-sdl2/
*)
open Sdl

let () =
  Sdl.init [`AUDIO];
 
  let wav_spec = Audio.new_audio_spec () in

  (* load WAV file *)
  let wav_buf, wav_len =
    Audio.load_wav "./_tremLoadingloopl.wav" wav_spec in

  (* open audio device *)
  let device_id = Audio.open_audio_device_simple wav_spec in

  (* play audio *)
  Audio.queue_audio device_id wav_buf wav_len;
  Audio.unpause_audio_device device_id;

  (* keep application running long enough to hear the sound *)
  Timer.delay 9000;

  (* clean up *)
  Audio.close_audio_device device_id;
  Audio.free_audio_spec wav_spec;
  Audio.free_wav wav_buf;

  Sdl.quit ()
