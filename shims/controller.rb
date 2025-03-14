# noinspection RubyUnusedLocalVariable
module GTK
  # Represents controllers connected to the usb ports.
  # Access via args.inputs.controller_one through controller_four.
  # Also available as an array: args.inputs.controllers
  class Controller
    include DirectionalInputHelperMethods
    include ControllerKeys

    # String value representing the controller's name.
    attr_reader :name
    
    # Returns true if a controller is connected.
    # If false, controller properties will return 0 for directional properties 
    # and false for button state properties.
    attr_reader :connected
    
    # Returns true if any of the controller's buttons were used.
    attr_reader :active
    
    # Returns the tick count when the controller was last active.
    attr_reader :active_at
    
    # Returns the global tick count when the controller was last active.
    attr_reader :active_global_at
    
    # Returns true if the specific button was pressed on this frame.
    attr_reader :key_down
    
    # Returns true if the specific button was released on this frame.
    attr_reader :key_up
    
    # Returns true if the specific button is being held.
    attr_reader :key_held
    
    # Returns the raw integer value for the left analog's horizontal movement (-32,767 to +32,767).
    attr_reader :left_analog_x_raw
    
    # Returns the raw integer value for the left analog's vertical movement (-32,767 to +32,767).
    attr_reader :left_analog_y_raw
    
    # Returns a number between -1 and 1 representing the percentage the left analog 
    # is moved horizontally as a ratio of the maximum movement.
    attr_reader :left_analog_x_perc
    
    # Returns a number between -1 and 1 representing the percentage the left analog 
    # is moved vertically as a ratio of the maximum movement.
    attr_reader :left_analog_y_perc
    
    # Returns the raw integer value for the right analog's horizontal movement (-32,767 to +32,767).
    attr_reader :right_analog_x_raw
    
    # Returns the raw integer value for the right analog's vertical movement (-32,767 to +32,767).
    attr_reader :right_analog_y_raw
    
    # Returns a number between -1 and 1 representing the percentage the right analog 
    # is moved horizontally as a ratio of the maximum movement.
    attr_reader :right_analog_x_perc
    
    # Returns a number between -1 and 1 representing the percentage the right analog 
    # is moved vertically as a ratio of the maximum movement.
    attr_reader :right_analog_y_perc
    
    # The default value is 3600. Lowers values make the analog sticks more responsive,
    # but may cause drift (especially on Steam Deck).
    attr_reader :analog_dead_zone
    
    # Returns true if up is pressed or held on the directional or left analog.
    attr_reader :up
    
    # Returns true if down is pressed or held on the directional or left analog.
    attr_reader :down
    
    # Returns true if left is pressed or held on the directional or left analog.
    attr_reader :left
    
    # Returns true if right is pressed or held on the directional or left analog.
    attr_reader :right

    # Returns true if the specific button was pressed on this frame.
    # Given a symbol representing the button name (e.g., :a, :b, :x, :y, etc.)
    #
    #   if args.inputs.controller_one.key_down?(:a)
    #     # A button was just pressed
    #   end
    def key_down?(key) end

    # Returns true if the specific button was released on this frame.
    # Given a symbol representing the button name.
    def key_up?(key) end

    # Returns true if the specific button is being held.
    # Given a symbol representing the button name.
    def key_held?(key) end

    # Returns true if the specific button is pressed or held.
    # Given a symbol representing the button name.
    def key_down_or_held?(key) end

    # Returns the angle in degrees of the left analog stick's current position.
    def left_analog_angle
    end

    # Returns the angle in degrees of the right analog stick's current position.
    def right_analog_angle
    end

    # Returns true if the Left Analog Stick is tilted beyond the threshold.
    # The threshold_raw (0-32,767) and threshold_perc (0-1) are optional parameters
    # that set the minimum threshold for the analog stick to be considered active.
    #
    #   if args.inputs.controller_one.left_analog_active?(threshold_perc: 0.5)
    #     # Left stick is moved at least halfway in some direction
    #   end
    def left_analog_active?(threshold_raw: nil, threshold_perc: nil) end

    # Returns true if the Right Analog Stick is tilted beyond the threshold.
    # The threshold_raw (0-32,767) and threshold_perc (0-1) are optional parameters
    # that set the minimum threshold for the analog stick to be considered active.
    def right_analog_active?(threshold_raw: nil, threshold_perc: nil) end

    # Activates a button's down state (for virtual controller input).
    def activate_down(key) end

    # Activates a button's held state (for virtual controller input).
    def activate_held(key) end

    # Activates a button's up state (for virtual controller input).
    def activate_up(key) end

    # Returns controller left hand input state.
    def left_hand
    end

    # Returns controller right hand input state.
    def right_hand
    end

    # Returns a collection of Symbols that represent all keys 
    # that are in the pressed or held state.
    #
    #   # Check what buttons are currently active
    #   puts args.inputs.controller_one.truthy_keys
    def truthy_keys
    end

    module ControllerKeys
      attr_reader :up
      attr_reader :down
      attr_reader :left
      attr_reader :right
      attr_reader :a
      attr_reader :b
      attr_reader :x
      attr_reader :y
      attr_reader :l1
      attr_reader :r1
      attr_reader :l2
      attr_reader :r2
      attr_reader :l3
      attr_reader :r3
      attr_reader :start
      attr_reader :select
      attr_reader :home
      attr_reader :back
      attr_reader :guide
      attr_reader :directional_up
      attr_reader :directional_down
      attr_reader :directional_left
      attr_reader :directional_right

      alias dpad_up directional_up
      alias dpad_down directional_down
      alias dpad_left directional_left
      alias dpad_right directional_right
      alias up_dpad directional_up
      alias down_dpad directional_down
      alias left_dpad directional_left
      alias right_dpad directional_right
    end

    class Keys
      include ControllerKeys

      def activate(key) end

      def deactivate(key) end
    end
  end
end
