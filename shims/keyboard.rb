# noinspection RubyUnusedLocalVariable
module GTK
  # Represents the user's keyboard.
  # Access via `args.inputs.keyboard`.
  class Keyboard
    include DirectionalInputHelperMethods

    # Returns Kernel.tick_count if any keys on the keyboard were pressed.
    attr_reader :active
    
    # Returns true if the game has keyboard focus.
    attr_reader :has_focus
    
    # Returns true if the specific key was released on this frame.
    attr_reader :key_up
    
    # Returns true if the specific key is being held down.
    attr_reader :key_held
    
    # Returns true if the specific key was pressed on this frame.
    attr_reader :key_down
    
    # Returns true if the key is being held and repeating (based on OS key repeat speed).
    attr_reader :key_repeat

    # Returns true if the specific key was pressed on this frame.
    # Given a symbol representing the key name.
    # 
    #   if args.inputs.keyboard.key_down?(:space)
    #     # Space key was just pressed
    #   end
    def key_down?(key_name) end

    # Returns true if the specific key was released on this frame.
    # Given a symbol representing the key name.
    def key_up?(key_name) end

    # Returns true if the specific key is being held.
    # Given a symbol representing the key name.
    def key_held?(key_name) end

    # Returns true if the key is being held and repeating (based on OS key repeat speed).
    # Given a symbol representing the key name.
    def key_repeat?(key_name) end

    # Returns true if the specific key is pressed or held.
    # Given a symbol representing the key name.
    def key_down_or_held?(key_name) end

    # Returns true if the P key is pressed or held.
    def p
    end

    # Returns true if the left arrow or A key is pressed or held.
    def left
    end

    # Returns true if the left arrow key is pressed or held.
    def left_arrow
    end

    # Returns true if the right arrow or D key is pressed or held.
    def right
    end

    # Returns true if the right arrow key is pressed or held.
    def right_arrow
    end

    # Returns true if the up arrow or W key is pressed or held.
    def up
    end

    # Returns true if the up arrow key is pressed or held.
    def up_arrow
    end

    # Returns true if the down arrow or S key is pressed or held.
    def down
    end

    # Returns true if the down arrow key is pressed or held.
    def down_arrow
    end

    # Returns a Hash with all keys on the keyboard in their respective state.
    # Contains the following keys: :down, :held, :down_or_held, :up, :repeat
    #
    #   # Check if any key is in the down state
    #   if args.inputs.keyboard.keys[:down].any?
    #     puts "A key was pressed"
    #   end
    def key
    end

    # Alias for key.
    alias keys key
  end

  class KeyboardKeys
    attr_reader :keycodes
    attr_reader :raw_key
    attr_reader :char
    attr_reader :tilde
    attr_reader :underscore
    attr_reader :double_quotation_mark
    attr_reader :exclamation_point
    attr_reader :at
    attr_reader :hash
    attr_reader :dollar
    attr_reader :percent
    attr_reader :caret
    attr_reader :ampersand
    attr_reader :asterisk
    attr_reader :open_round_brace
    attr_reader :close_round_brace
    attr_reader :open_curly_brace
    attr_reader :close_curly_brace
    attr_reader :colon
    attr_reader :plus
    attr_reader :pipe
    attr_reader :question_mark
    attr_reader :less_than
    attr_reader :greater_than
    attr_reader :section
    attr_reader :ordinal_indicator
    attr_reader :superscript_two
    attr_reader :zero
    attr_reader :one
    attr_reader :two
    attr_reader :three
    attr_reader :four
    attr_reader :five
    attr_reader :six
    attr_reader :seven
    attr_reader :eight
    attr_reader :nine
    attr_reader :backspace
    attr_reader :delete
    attr_reader :escape
    attr_reader :enter
    attr_reader :tab
    attr_reader :open_square_brace
    attr_reader :close_square_brace
    attr_reader :semicolon
    attr_reader :equal
    attr_reader :hyphen
    attr_reader :space
    attr_reader :single_quotation_mark
    attr_reader :backtick
    attr_reader :period
    attr_reader :comma
    attr_reader :a
    attr_reader :b
    attr_reader :c
    attr_reader :d
    attr_reader :e
    attr_reader :f
    attr_reader :g
    attr_reader :h
    attr_reader :i
    attr_reader :j
    attr_reader :k
    attr_reader :l
    attr_reader :m
    attr_reader :n
    attr_reader :o
    attr_reader :p
    attr_reader :q
    attr_reader :r
    attr_reader :s
    attr_reader :t
    attr_reader :u
    attr_reader :v
    attr_reader :w
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :forward_slash
    attr_reader :back_slash
    attr_reader :caps_lock
    attr_reader :f1
    attr_reader :f2
    attr_reader :f3
    attr_reader :f4
    attr_reader :f5
    attr_reader :f6
    attr_reader :f7
    attr_reader :f8
    attr_reader :f9
    attr_reader :f10
    attr_reader :f11
    attr_reader :f12
    attr_reader :print_screen
    attr_reader :scroll_lock
    attr_reader :pause
    attr_reader :insert
    attr_reader :home
    attr_reader :page_up
    attr_reader :end
    attr_reader :page_down
    attr_reader :left_arrow
    attr_reader :right_arrow
    attr_reader :up_arrow
    attr_reader :down_arrow
    attr_reader :num_lock
    attr_reader :kp_divide
    attr_reader :kp_multiply
    attr_reader :kp_minus
    attr_reader :kp_plus
    attr_reader :kp_enter
    attr_reader :kp_one
    attr_reader :kp_two
    attr_reader :kp_three
    attr_reader :kp_four
    attr_reader :kp_five
    attr_reader :kp_six
    attr_reader :kp_seven
    attr_reader :kp_eight
    attr_reader :kp_nine
    attr_reader :kp_zero
    attr_reader :kp_period
    attr_reader :kp_equals
    attr_reader :shift
    attr_reader :control
    attr_reader :alt
    attr_reader :meta
    attr_reader :shift_left
    attr_reader :shift_right
    attr_reader :control_left
    attr_reader :control_right
    attr_reader :alt_left
    attr_reader :alt_right
    attr_reader :meta_left
    attr_reader :meta_right
    attr_reader :ac_search
    attr_reader :ac_home
    attr_reader :ac_back
    attr_reader :ac_forward
    attr_reader :ac_stop
    attr_reader :ac_refresh
    attr_reader :ac_bookmarks
    attr_reader :w_scancode
    attr_reader :a_scancode
    attr_reader :s_scancode
    attr_reader :d_scancode

    alias section_sign section
    alias equal_sign equal
    alias dollar_sign dollar
    alias percent_sign percent
    alias circumflex caret
    alias less_than_sign less_than
    alias greater_than_sign greater_than
    alias left_shift shift_left
    alias right_shift shift_right
    alias option alt
    alias option_left alt_left
    alias option_right alt_right
    alias left_alt alt_left
    alias right_alt alt_right
    alias left_option alt_left
    alias right_option alt_right
    alias command meta
    alias command_left meta_left
    alias command_right meta_right
    alias left_meta meta_left
    alias right_meta meta_right
    alias left_command meta_left
    alias right_command meta_right
    alias ctrl control
    alias left_control control_left
    alias right_control control_right
    alias left_ctrl control_left
    alias right_ctrl control_right
    alias minus hyphen
    alias dash hyphen
    alias pageup page_up
    alias pagedown page_down
    alias backslash back_slash
    alias forwardslash forward_slash
    alias capslock caps_lock
    alias scrolllock scroll_lock
    alias numlock num_lock
    alias printscreen print_screen
    alias break pause
    alias left left_arrow
    alias right right_arrow
    alias up up_arrow
    alias down down_arrow
  end
end
