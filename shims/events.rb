# noinspection RubyUnusedLocalVariable
module GTK
  # Contains system events like window resize and orientation change events.
  # Access through args.events in your game code.
  module Events
    # Will be true if the window is resized or if the orientation of the game is changed.
    #
    # Example:
    #   def tick args
    #     if args.events.resize_occurred
    #       # Handle resize event
    #     end
    #   end
    attr_reader :resize_occurred
    
    # Will be true if the orientation of the game has changed.
    # This event is specifically important to handle if you use render targets
    # and if your game supports both landscape/portrait modes.
    #
    # Example:
    #   def tick args
    #     if args.events.orientation_changed
    #       # Re-initialize render targets
    #     end
    #   end
    attr_reader :orientation_changed
    
    # An Array of Hashes useful for debugging purposes.
    # Raw events are processed and reflected in the rest of DragonRuby's API,
    # so it's unlikely that you'll have to leverage anything within this collection directly.
    attr_reader :raw
  end
end
