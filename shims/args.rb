# noinspection RubyUnusedLocalVariable
module GTK
  class Args
    # The GTK::Runtime class is the core of DragonRuby.
    #
    # All functions are available through `$gtk`, `GTK`, or inside of the `tick` method through `args`:
    #
    #   def tick args
    #     args.gtk.function(...)
    #
    #     # OR available globally
    #     $gtk.function(...)
    #     # OR
    #     GTK.function(...)
    #   end
    attr_reader :runtime

    # Hash containing metadata pulled from the files under the ./metadata directory.
    # Each CVar has the following properties: value, name, description, type, locked.
    #
    # Example of retrieving game version:
    #   args.outputs.labels << {
    #     x: 640,
    #     y: 360,
    #     text: args.cvars["game_metadata.version"].value.to_s
    #   }
    #
    # Available configuration settings are defined in:
    # - metadata/cvars.txt: Web server settings
    # - metadata/game_metadata.txt: Game metadata, orientation, scale settings
    # - metadata/ios_metadata.txt: iOS deployment settings
    attr_reader :cvars

    # Provides access to user input from keyboard, mouse, controllers, and touch.
    # Access through +args.inputs+ in your game code.
    attr_reader :inputs

    # Outputs is how you render primitives to the screen.
    # Access through +args.outputs+ in your game code.
    attr_reader :outputs

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
    attr_reader :audio

    # Provides information about the screen and game canvas.
    # All functions are available globally via Grid.* or through args.grid
    attr_reader :grid

    # Contains methods for calculations that are frequently used in game development.
    # Most functions are mixed into Hash, Array, and DragonRuby's Entity class.
    attr_reader :geometry

    # Contains system events like window resize and orientation change events.
    # Access through args.events in your game code.
    attr_reader :events

    # Provides APIs for placing primitives on a virtual grid within the "safe area" across all platforms.
    # Useful for rendering static controls like buttons, menu items, configuration screens, etc.
    # All functions are available globally via +Layout.*+ or through args.layout
    attr_reader :layout

    # A set of functions that allow you to determine the current progression of an easing function.
    # All functions are available globally via +Easing.*+.
    attr_reader :easing

    # Contains various utilities for functional programming.
    attr_reader :fn

    # Contains String helpers.
    attr_reader :string

    # Store your game state inside of this module.
    # Properties with arbitrary nesting are allowed and a backing Entity will be created for you.
    #
    #   def tick args
    #     args.state.player.x ||= 0
    #     args.state.player.y ||= 0
    #   end
    attr_reader :state

    # Temporary state that gets reset each tick.
    # Useful for storing data that only needs to exist for one frame.
    attr_reader :temp_state

    # Represents the user's keyboard.
    # Access via `args.inputs.keyboard`.
    attr_reader :keyboard

    # Represents the user's mouse. Access via +args.inputs.mouse+.
    attr_reader :mouse

    # Returns the current tick of the game.
    # Begins at 0 when the game is first started, or restarted via ~$gtk.reset~.
    # Accessible via ~args.state.tick_count~, ~args.tick_count~, and even ~Kernel.tick_count~.
    #
    #   def tick args
    #     args.outputs.labels << {
    #       x: 640,
    #       y: 360,
    #       text: "current tick count is: #{args.tick_count}"
    #     }
    #   end
    attr_reader :tick_count

    # Returns mouse click point.
    attr_reader :click

    # Returns the tick count when the mouse was last clicked.
    attr_reader :click_at

    # Represents controllers connected to the usb ports.
    attr_reader :controller_one
    # Represents controllers connected to the usb ports.
    attr_reader :controller_two
    # Represents controllers connected to the usb ports.
    attr_reader :controller_three
    # Represents controllers connected to the usb ports.
    attr_reader :controller_four

    # See: GTK::SolidsOutputsArray
    attr_reader :solids

    # See: GTK::SpritesOutputsArray
    attr_reader :sprites

    # See: GTK::LabelsOutputsArray
    attr_reader :labels

    # See: GTK::LinesOutputsArray
    attr_reader :lines

    # See: GTK::BordersOutputsArray
    attr_reader :borders

    # See: GTK::PrimitivesOutputsArray
    attr_reader :primitives

    # See: GTK::StaticSolidsOutputsArray
    attr_reader :static_solids

    # See: GTK::StaticSpritesOutputsArray
    attr_reader :static_sprites

    # See: GTK::StaticLabelsOutputsArray
    attr_reader :static_labels

    # See: GTK::StaticLinesOutputsArray
    attr_reader :static_lines

    # See: GTK::StaticBordersOutputsArray
    attr_reader :static_borders

    # See: GTK::StaticPrimitivesOutputsArray
    attr_reader :static_primitives

    # Clears all pixel arrays from memory.
    # Use to free up memory when pixel arrays are no longer needed.
    def clear_pixel_arrays
    end

    # Alias for clear_pixel_arrays. Clears all pixel arrays from memory.
    def pixel_arrays_clear
    end

    # Returns a hash of all pixel arrays currently in memory.
    def pixel_arrays
    end

    # Gets or creates a pixel array with the given name.
    # 
    # After creating a pixel array, you need to set its width, height, and fill its pixels.
    # 
    #   w = 200
    #   h = 100
    #   args.pixel_array(:my_pixel_array).w = w
    #   args.pixel_array(:my_pixel_array).h = h
    #   args.pixel_array(:my_pixel_array).pixels.fill #FF00FF00, 0, w * h
    #
    # You can draw it by using the symbol for :path:
    # 
    #   args.outputs.sprites << { x: 500, y: 300, w: 200, h: 100, path: :my_pixel_array }
    def pixel_array(name) end
  end
end
