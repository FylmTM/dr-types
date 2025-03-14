# noinspection RubyUnusedLocalVariable
module GTK
  # Provides access to user input from keyboard, mouse, controllers, and touch.
  # Access through args.inputs in your game code.
  class Inputs
    # Access to keyboard state and input
    attr_reader :keyboard
    
    # Returns a string representing the last key pressed on the keyboard
    attr_reader :text
    
    # Access to mouse state and input
    attr_reader :mouse
    
    # Array of all controllers (controller_one through controller_four)
    attr_reader :controllers
    
    # Access to first controller
    attr_reader :controller_one
    
    # Access to second controller
    attr_reader :controller_two
    
    # Access to third controller
    attr_reader :controller_three
    
    # Access to fourth controller
    attr_reader :controller_four
    
    # Returns true if touch is enabled on the device
    attr_reader :touch_enabled
    
    # Hash representing all touch points on a touch device
    attr_reader :touch
    
    # Timestamp when multi-touch finger was released
    attr_reader :multi_touch_finger_up_at
    
    # First touch finger
    attr_reader :finger_one
    
    # Second touch finger
    attr_reader :finger_two
    
    # Touch point on the left side of the screen
    attr_reader :finger_left
    
    # Touch point on the right side of the screen
    attr_reader :finger_right
    
    # Information about pinch zoom gestures
    attr_reader :pinch_zoom
    
    # Center point between touches
    attr_reader :touch_center
    
    # HTTP requests
    attr_reader :http_requests
    
    # Input history
    attr_reader :history
    
    # Returns the last active input (:keyboard, :mouse, or :controller)
    # Useful for displaying appropriate on-screen instructions
    #
    # Example:
    #   if args.inputs.last_active == :controller
    #     args.outputs.labels << { x: 60, y: 60, text: "Use the D-Pad to move around." }
    #   else
    #     args.outputs.labels << { x: 60, y: 60, text: "Use the arrow keys to move around." }
    #   end
    attr_reader :last_active
    
    # Returns tick_count of when the specific input was last active
    attr_reader :last_active_at
    
    # Returns global_tick_count of when the specific input was last active
    attr_reader :last_active_global_at
    
    # Returns the ISO 639-1 two-letter language code based on OS preferences
    attr_reader :locale
    
    # Raw locale string
    attr_reader :locale_raw
    
    # Returns true if up arrow/w key is pressed or held, or if controller up is active 
    attr_reader :up
    
    # Returns true if down arrow/s key is pressed or held, or if controller down is active
    attr_reader :down
    
    # Returns true if left arrow/a key is pressed or held, or if controller left is active
    attr_reader :left
    
    # Returns true if right arrow/d key is pressed or held, or if controller right is active
    attr_reader :right
    
    # Aliases for WASD movement
    alias up_with_wasd up
    alias down_with_wasd down
    alias left_with_wasd left
    alias right_with_wasd right
    
    # Returns -1 (left), 0 (neutral), or +1 (right)
    # Considers keyboard WASD, arrow keys, controller DPAD, and analog stick
    attr_reader :left_right
    
    # Returns a floating point value between -1 and 1 for horizontal input
    attr_reader :left_right_perc
    
    # Returns -1 (left), 0 (neutral), or +1 (right)
    # Only considers arrow keys and controller DPAD (not WASD or analog stick)
    attr_reader :left_right_directional
    
    # Returns a floating point value between -1 and 1 for horizontal directional input
    attr_reader :left_right_directional_perc
    
    # Aliases for horizontal movement
    alias left_right_with_wasd left_right
    alias left_right_perc_with_wasd left_right_perc
    alias left_right_arrow left_right_directional
    
    # Returns -1 (down), 0 (neutral), or +1 (up)
    # Considers keyboard WASD, arrow keys, controller DPAD, and analog stick
    attr_reader :up_down
    
    # Returns a floating point value between -1 and 1 for vertical input
    attr_reader :up_down_perc
    
    # Returns -1 (down), 0 (neutral), or +1 (up)
    # Only considers arrow keys and controller DPAD (not WASD or analog stick)
    attr_reader :up_down_directional
    
    # Returns a floating point value between -1 and 1 for vertical directional input
    attr_reader :up_down_directional_perc
    
    # Aliases for vertical movement
    alias up_down_with_wasd up_down
    alias up_down_arrow up_down_directional

    # Returns normalized vector based on directional input (WASD/arrow keys)
    # Returns nil if no keys are down/held
    def directional_vector
    end

    # Returns angle in degrees based on directional input (WASD/arrow keys)
    # Returns nil if no keys are down/held
    def directional_angle
    end

    # Returns mouse click information
    # Alias for mouse.down - returns an entity with x,y properties and collision helpers
    def click
    end

    # Returns the controller at the specified index (0-3)
    def controller_at(index) end
  end
end
