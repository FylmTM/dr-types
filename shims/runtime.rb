# noinspection RubyUnusedLocalVariable
module GTK
  include Runtime

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
  module Runtime
    include TopLevelFunctions
    include RuntimeFFI
    include RuntimeBenchmarks
    include RuntimeDeveloperSupport
    include RuntimeDownloadStb
    include RuntimeDraw
    include RuntimeFramerate
    include RuntimeNotification
    include RuntimePlatform
    include RuntimeWindow
    include RuntimeEnvironmentAndUtility
    include RuntimeSerde
    include RuntimeFileIO
    include RuntimeNetworkIO
    include RuntimeRecording
  end

  module TopLevelFunctions
    # Resets your game as if it were started for the first time.
    # Any methods that were added to classes during hotload will be removed,
    # leaving you with a pristine environment.
    #
    #   $gtk.reboot
    def reboot
    end
  end

  module RuntimeFFI
    # Loads a precompiled C Extension into your game.
    # Provide the name of the library (without the `lib` prefix or platform-specific file extension).
    #
    #   $gtk.dlopen "my_extension"
    def dlopen(path) end

    # Returns the path that will be searched for dynamic libraries when using `dlopen`.
    # You can optionally pass in a String representing the library name to get the full path to the library.
    #
    #   path = $gtk.get_dlopen_path           # gets the base search path
    #   full_path = $gtk.get_dlopen_path "my_extension"  # gets path to specific library
    def get_dlopen_path(path) end

    def ffi_misc
    end
  end

  module RuntimeFFIMisc
    def gtk_dlopen(path) end
  end

  module RuntimeBenchmarks
    def self.benchmark(seconds: nil, iterations: nil, **benchmarks) end
  end

  module RuntimeDeveloperSupport
    # Returns a string representing the version of DragonRuby you are running.
    def version
    end

    # Returns `true` if the version of DragonRuby is NOT Standard Edition.
    def version_pro?
    end

    # Returns a version string defined in `mygame/game_metadata.txt`.
    def game_version
    end

    # Resets DragonRuby's internal state as if it were just started.
    # `Kernel.tick_count` is set to `0` and `args.state` is cleared of any values.
    #
    #   $gtk.reset  # resets the game
    #   
    #   # Optionally set RNG seed
    #   $gtk.reset seed: 100  # resets with specific seed
    def reset(seed: nil) end

    # Same behavior as `reset` except the reset occurs before `tick` is executed again.
    # Use inside the `tick` method so you don't accidentally blow away state that your game 
    # depends on to complete the current `tick` without exceptions.
    #
    #   # reset the game if "r" is pressed on the keyboard
    #   if args.inputs.keyboard.key_down.r
    #     args.gtk.reset_next_tick
    #   end
    def reset_next_tick(seed: nil) end

    # Returns the value used to seed RNG.
    def seed
    end

    # Sets RNG without resetting your game state.
    def set_rng(seed) end

    # Sets an environment variable.
    # Parameters:
    # - name: String representing the environment variable name
    # - value: String representing the value
    # - overwrite: Boolean representing whether to overwrite if it already exists
    def setenv(name, value, overwrite) end

    # Returns the value of the environment variable as a String.
    # Returns nil if the environment variable does not exist.
    def getenv(name) end

    # Invalidates the cache record of a sprite so that updates from disk can be loaded.
    # This function can also be used to delete/garbage collect render targets you are no longer using.
    def reset_sprite(path) end

    # Invalidates the cache record of all sprites so that updates from disk can be loaded.
    # This function is automatically called when `args.gtk.reset` is invoked.
    def reset_sprites(directory: nil, indentation: nil, suppress_logging: nil) end

    # Given a path to a sprite, returns the width and height of a sprite as a tuple.
    # 
    # NOTE: For development purposes only. Do not use every frame.
    def calcspritebox(str) end

    # Helps you audit your game for array-based primitives to improve performance.
    # Array-based primitives are slower to process than Hash or Class based primitives.
    #
    #   # enable array based primitives warnings
    #   args.gtk.warn_array_primitives!
    #   
    #   # this will log a warning message
    #   args.outputs.sprites << [100, 100, 200, 200, "sprites/square/blue.png"]
    def warn_array_primitives!
    end

    # Adds caller information alongside each `puts` statement.
    # Useful for hunting down rogue `puts` statements in your code.
    #
    #   # at the TOP of your tick method
    #   $gtk.trace_puts!
    def trace_puts!
    end

    alias add_caller_to_puts! trace_puts!

    # Speeds up your simulation loop by the given factor. For debugging purposes.
    def speedup!(factor) end

    # Slows down your simulation loop to a slower rate. For debugging purposes.
    # Given a numeric value representing the factor of 60fps.
    #
    #   args.gtk.slowmo! 2  # set simulation speed to 30 fps
    #   args.gtk.slowmo! 4  # set simulation speed to 15 fps
    #   args.gtk.slowmo! 60 # set simulation speed to 1 fps
    def slowmo!(factor, should_notify = false) end

    alias slowdown! slowmo!

    # Returns a string representing the command line arguments passed to the DragonRuby binary.
    # For development/debugging purposes only.
    def argv
    end

    # Returns a Hash for command line arguments in the format of `--switch value`.
    # For development/debugging purposes only.
    def cli_arguments
    end

    # Returns relative path to the game directory.
    def get_relative_game_dir
    end

    # Returns the path to the location of the dragonruby binary.
    # In production, this value will be the same as returned by `get_game_dir`.
    # For debugging/development workflows only.
    def get_base_dir
    end

    # Returns the location within sandbox storage that the game is running.
    # In development, this value will be your `mygame` directory.
    # In production, returns an OS-specific value (e.g., Roaming directory on Windows).
    def get_game_dir
    end

    # Opens the game directory in the OS's file explorer.
    # For debugging purposes only.
    def open_game_dir(additional_directories = nil) end

    # Returns a URL encoded string representing the sandbox location for game data.
    def get_game_dir_url(additional_directories = nil) end

    # Captures performance timing information for a given category.
    def capture_timings(category:, color: nil) end

    # Shows the DragonRuby console.
    # Useful when debugging/customizing an in-game dev workflow.
    def show_console
    end

    # Hides the DragonRuby console.
    # Useful when debugging/customizing an in-game dev workflow.
    def hide_console
    end

    # Enables the DragonRuby Console so it can be shown by pressing the tilde key.
    def enable_console
    end

    # Disables the DragonRuby Console so it won't show up even if you press the tilde key.
    def disable_console
    end

    # Disables the CTRL+R keyboard shortcut for resetting the game.
    #
    #   $gtk.disable_reset_via_ctrl_r
    def disable_reset_via_ctrl_r
    end

    # Disables DragonRuby's built-in controller configuration/mapping wizard.
    #
    #   $gtk.disable_controller_config
    def disable_controller_config
    end

    # Enables DragonRuby's built-in controller configuration/mapping wizard.
    # This is enabled by default.
    #
    #   $gtk.enable_controller_config
    def enable_controller_config
    end

    # Returns a Hash representing the code files that have been loaded for your game
    # along with timings for the events. For development/debugging purposes only.
    def reload_history
    end

    # Returns a Hash for files that have been queued for reload, but haven't been processed yet.
    # For development/debugging purposes only.
    def reload_history_pending
    end

    # Queues a file for reload if it's been modified.
    # An optional second parameter can be passed to force load regardless of modification time.
    # For development/debugging purposes only.
    def reload_if_needed(arg, force) end

    # iOS only (returns nil for other platforms). 
    # Returns a symbol representing the thermal state of the device: 
    # :unknown, :nominal, :fair, :serious, :critical
    def current_thermal_state
    end
  end

  module RuntimeDownloadStb
    def download_stb_rb(url) end

    def download_stb_rb_raw(download_url, save_path) end

    def download_stb_rb_print_usage
    end
  end

  module RuntimeDraw
    def draw_solid(s) end

    def draw_sprite(s) end

    def draw_screenshot(s) end

    def draw_label(l) end

    def draw_line(l) end

    def draw_border(s) end

    def draw_screenshots
    end

    def pixel_arrays
    end

    def draw_primitive(p) end
  end

  module RuntimeFramerate
    def disable_framerate_warning!
    end

    def enable_framerate_warning!
    end

    def reset_framerate_calculation
    end

    def framerate_should_show_warning?
    end

    def check_framerate
    end

    def framerate_diagnostics
    end

    def framerate_below_threshold?
    end

    def current_framerate
    end

    def get_framerate_diagnostics
    end

    alias framerate_get_diagnostics get_framerate_diagnostics

    def framerate_warning_message
    end

    def current_framerate_primitives
    end

    def framerate_diagnostics_primitives
    end
  end

  module RuntimeNotification
    def notify!(message, duration = 300) end

    def notify_extended!(message: "", duration: 300, env: :dev, a: 255, overwrite: false) end
  end

  module RuntimePlatform
    attr_reader :platform
    attr_reader :platform_mapping
    attr_reader :is_steam_release

    def platform?(value) end
  end

  module RuntimeWindow
    # Returns `true` if the window can be resized on the platform the game is running on.
    # Useful for conditionally showing a "Toggle Fullscreen" option in your game.
    def can_resize_window?
    end

    # Returns `true` if the window can be moved on the platform the game is running on.
    def can_move_window?
    end

    # Returns `true` if quitting is allowed on the platform you are releasing to.
    # Note that iOS and Web games do not allow exiting.
    def can_close_window?
    end

    # Returns `true` if the game's orientation can be altered while the game is running.
    def can_change_orientation?
    end

    # Toggles the fullscreen state of the window.
    def toggle_window_fullscreen
    end

    # Sets the window's fullscreen state.
    # Takes a boolean parameter - `true` for fullscreen, `false` for windowed mode.
    #
    #   # make the game full screen after 10 seconds
    #   if Kernel.tick_count == 600
    #     args.gtk.set_window_fullscreen true
    #   end
    def set_window_fullscreen(enable) end

    # Returns `true` if the window is currently in fullscreen mode.
    def window_fullscreen?
    end

    # Updates the title of the game in the Menu Bar.
    # The default title is specified in `mygame/metadata/game_metadata.txt`.
    #
    #   args.gtk.set_window_title "My Amazing Game - Level 5"
    def set_window_title(title) end

    # Resizes the game window to a percentage of 1280x720 (or 720x1280 in portrait mode).
    # First parameter is a float value for scale. Valid options: 0.1, 0.25, 0.5, 0.75, 1.25, 1.5, 2.0, 2.5, 3.0, 4.0.
    # The optional second and third parameters set the aspect ratio (default 16:9).
    #
    #   # how your game will look on an iPad
    #   $gtk.set_window_scale 1.0, 4, 3
    #   
    #   # how your game will look on a wide aspect ratio
    #   $gtk.set_window_scale 1.0, 21, 9
    def set_window_scale(scale_value, aspect_unit_w = 16, aspect_unit_h = 9) end

    # Moves the game window to the next monitor if you have multiple monitors.
    # The function will cycle back to the first monitor if needed.
    def move_window_to_next_display
    end

    # Maximizes the game window if `can_resize_window?` returns `true`.
    def maximize_window
    end

    # Sets the game's orientation while the game is running.
    # Accepts `:landscape` or `:portrait` as the parameter.
    def set_orientation(orientation_name) end

    # Changes the orientation of the game from landscape to portrait (or portrait to landscape).
    # Useful for testing rendering of games that support both orientations.
    def toggle_orientation
    end

    # Sets the max HD scale for your game while it's running.
    # Function accepts one of these Integer values:
    # - 100: 720p (1280x720)
    # - 125: HD+ (1600x900)
    # - 150: 1080p/Full HD (1920x1080)
    # - 175: Full HD+ (2240x1260)
    # - 200: 1440p (2560x1440)
    # - 250: 1800p (3200x1800)
    # - 300: 4k (3840x2160)
    # - 400: 5k (6400x2880)
    def set_hd_max_scale(hd_max_scale) end

    # Sets the scale quality for the game.
    def set_scale_quality(scale_quality) end

    # Adds or removes the letterbox within your game while it's running.
    # Takes a boolean parameter.
    # Useful for testing how your game renders on edge-to-edge displays.
    def set_hd_letterbox(enabled) end

    # Toggles the letterbox within your game while it's running.
    # Useful for testing how your game renders on edge-to-edge displays.
    def toggle_hd_letterbox
    end
  end

  module RuntimeEnvironmentAndUtility
    def calcstringbox(text) end

    def get_pixels(file) end

    def request_quite
    end

    def quit_request?
    end

    def production?
    end

    def openurl(url) end

    def system(command) end

    def exec(command) end

    def show_cursor
    end

    def hide_cursor
    end

    def cursor_shown?
    end

    def set_mouse_grab(mode) end

    def set_system_cursor(cursor_type) end

    def set_cursor(path, x, y) end

    def create_uuid
    end
  end

  module RuntimeSerde
    def parse_json(json) end

    def parse_json_file(path) end

    def parse_xml(xml) end

    def parse_xml_file(path) end
  end

  module RuntimeFileIO
    def list_files(path) end

    def stat_file(path) end

    def read_file(path) end

    def write_file(path, content) end

    def append_file(path, content) end

    def delete_file(path) end

    def write_file_root(path, content) end

    def append_file_root(path, content) end
  end

  module RuntimeNetworkIO
    def http_get(url) end

    def http_post(url, fields, headers = []) end

    def http_post_body(url, body, headers = []) end

    def start_server!(port: 9001, enable_in_prod: false) end
  end

  module RuntimeRecording
    def start_recording
    end

    def stop_recording
    end

    def cancel_recording
    end

    def start_replay(file) end

    def stop_replay
    end
  end
end
