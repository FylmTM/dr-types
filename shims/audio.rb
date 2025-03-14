# noinspection RubyUnusedLocalVariable
module GTK
  # Hash that contains audio sources that are playing.
  # 
  # Sounds that don't specify `looping: true` will be removed automatically from the hash after playback ends.
  # Looping sounds or sounds that should stop early must be removed manually.
  #
  # Example of playing a one-time sound:
  #   args.audio[:coin] = { input: "sounds/coin.wav" }
  #   # OR
  #   args.outputs.sounds << "sounds/coin.wav"
  #
  # Example of playing a looping sound:
  #   args.audio[:bg_music] = { input: "sounds/bg-music.ogg", looping: true }
  #
  # Example of stopping a sound:
  #   args.audio[:bg_music] = nil
  #   # OR
  #   args.audio.delete :bg_music
  #
  # Additional audio properties:
  #   args.audio[:my_audio] = {
  #     input: 'sound/boom.wav',  # file path relative to mygame directory
  #     gain:    1.0,             # Volume (float value 0.0 to 1.0)
  #     pitch:   1.0,             # Pitch of the sound (1.0 = original pitch)
  #     paused:  false,           # Set to true to pause the sound at the current playback position
  #     looping: true,            # Set to true to loop the sound/music until you stop it
  #     x: 0.0, y: 0.0, z: 0.0    # Relative position to the listener, x, y, z from -1.0 to 1.0
  #   }
  class Audio < Hash
    # Controls the global volume for all audio.
    # 
    # Example:
    #   # Decrease volume
    #   args.audio.volume -= 0.01
    #
    #   # Increase volume
    #   args.audio.volume += 0.01
    attr_accessor :volume
  end
end
