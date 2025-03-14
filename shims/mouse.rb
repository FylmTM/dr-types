# noinspection RubyUnusedLocalVariable
module GTK
  # Represents the user's mouse. Access via `args.inputs.mouse`.
  class Mouse
    include Geometry

    # Returns Kernel.tick_count if any mouse actions occurred.
    attr_reader :active
    
    # Returns true if the game has mouse focus.
    attr_reader :has_focus
    
    # Returns the current x location of the mouse.
    attr_reader :x
    
    # Returns the current y location of the mouse.
    attr_reader :y
    
    # Returns the x location of the mouse on the previous frame.
    attr_reader :previous_x
    
    # Returns the y location of the mouse on the previous frame.
    attr_reader :previous_y
    
    # Returns the difference between the current x location of the mouse and its previous x location.
    attr_reader :relative_x
    
    # Returns the difference between the current y location of the mouse and its previous y location.
    attr_reader :relative_y
    
    # Returns true if the mouse has moved on the current frame.
    attr_reader :moved
    
    # Returns the tick count when the mouse was last moved.
    attr_reader :moved_at
    
    # Returns the global tick count when the mouse was last moved.
    attr_reader :global_moved_at
    
    # Returns true if the left mouse button is down.
    attr_reader :button_left
    
    # Returns true if the middle mouse button is down.
    attr_reader :button_middle
    
    # Returns true if the right mouse button is down.
    attr_reader :button_right
    
    # Returns a bitmask for all buttons on the mouse:
    # 1 for a button in the down state, 0 for a button in the up state.
    attr_reader :button_bits
    
    # Represents the mouse wheel. Returns nil if no mouse wheel actions occurred.
    # Otherwise returns a Hash with x and y (representing movement on each axis).
    attr_reader :wheel
    
    # Returns information about when mouse button was released.
    attr_reader :up
    
    # Returns information about when mouse button was pressed.
    attr_reader :down
    
    # Returns information about mouse click. Alias for down.
    attr_reader :click
    
    # Returns information about the previous mouse click.
    attr_reader :previous_click
    
    # Returns true if the X1 mouse button is down.
    attr_reader :button_x1
    
    # Returns true if the X2 mouse button is down.
    attr_reader :button_x2
    
    # Returns the tick count when the mouse was last clicked.
    attr_reader :click_at
    
    # Returns the global tick count when the mouse was last clicked.
    attr_reader :global_click_at
    
    # Returns the tick count when the mouse button was last released.
    attr_reader :up_at
    
    # Returns the global tick count when the mouse button was last released.
    attr_reader :global_up_at
    
    # Returns true if the specific button was pressed on this frame.
    # The following button values are applicable: left, middle, right, x1, x2.
    attr_reader :key_down
    
    # Returns true if the specific button was released on this frame.
    # The following button values are applicable: left, middle, right, x1, x2.
    attr_reader :key_up
    
    # Returns true if the specific button is being held.
    # The following button values are applicable: left, middle, right, x1, x2.
    attr_reader :key_held
    
    # Collection of all mouse buttons.
    attr_reader :buttons
    
    # Returns a MousePoint with the current x and y coordinates.
    attr_reader :point
    
    # Returns a Rect representing the mouse position.
    attr_reader :rect
    
    # Alias for point.
    alias position point
    
    # Width for collision detection.
    attr_reader :w
    
    # Height for collision detection.
    attr_reader :h

    # Returns information about when mouse button is being held.
    def held
    end

    # Returns the tick count when the mouse button was last held.
    def held_at
    end

    # Returns the global tick count when the mouse button was last held.
    def global_held_at
    end

    # Returns true if the mouse is inside the specified rectangle.
    # Takes in any primitive that responds to x, y, w, h.
    # 
    #   if args.inputs.mouse.inside_rect?(args.state.button_rect)
    #     # Mouse is hovering over button
    #   end
    def inside_rect?(rect) end

    # Returns true if the mouse is inside the specified circle.
    # Takes a center point (any primitive that responds to x, y) and a radius.
    # 
    #   if args.inputs.mouse.inside_circle?({x: 400, y: 300}, 50)
    #     # Mouse is inside circle with center at 400,300 and radius 50
    #   end
    def inside_circle?(center, radius) end

    # Returns true if the mouse rect intersects with the given rectangle.
    def intersect_rect?(other_rect) end

    # Merges mouse properties with another object.
    def merge(o) end

    # Alias for button_left. Returns true if the left mouse button is down.
    def left
    end

    # Alias for button_middle. Returns true if the middle mouse button is down.
    def middle
    end

    # Alias for button_right. Returns true if the right mouse button is down.
    def right
    end

    # Alias for button_x1. Returns true if the X1 mouse button is down.
    def x1
    end

    # Alias for button_x2. Returns true if the X2 mouse button is down.
    def x2
    end

    # Returns true if the specific button was pressed on this frame.
    # Given a symbol like :left, :middle, :right, :x1, or :x2.
    # 
    #   if args.inputs.mouse.key_down?(:left)
    #     # Left mouse button was just pressed
    #   end
    def key_down?(key) end

    # Returns true if the specific button was released on this frame.
    # Given a symbol like :left, :middle, :right, :x1, or :x2.
    def key_up?(key) end

    # Returns true if the specific button is being held.
    # Given a symbol like :left, :middle, :right, :x1, or :x2.
    def key_held?(key) end

    # Returns true if the specific button is pressed or held.
    # Given a symbol like :left, :middle, :right, :x1, or :x2.
    def key_down_or_held?(key) end

    # Returns buffered click information.
    def buffered_click
    end

    # Returns buffered hold information.
    def buffered_held
    end
  end

  class MousePoint
    include Geometry

    attr_reader :x
    attr_reader :y
    attr_reader :point
    attr_reader :created_at
    attr_reader :global_created_at

    def initialize(x, y) end

    def w
    end

    def h
    end

    def left
    end

    def right
    end

    def top
    end

    def bottom
    end

    def created_at_elapsed
    end

    def to_hash
    end

    def to_h
    end
  end

  class FingerTouch
    attr_reader :moved
    attr_reader :moved_at
    attr_reader :global_moved_at
    attr_reader :down_at
    attr_reader :global_down_at
    attr_reader :touch_order
    attr_reader :first_tick_down
    attr_reader :x
    attr_reader :y
    attr_reader :previous_x
    attr_reader :previous_y

    def point
    end

    def inside_rect?(rect) end

    def inside_circle?(center, radius) end
  end

  class MouseButtons
    include Enumerable

    attr_reader :left
    attr_reader :middle
    attr_reader :right
    attr_reader :x1
    attr_reader :x2

    def each
    end
  end

  class MouseButton
    attr_reader :id
    attr_reader :index
    attr_reader :x
    attr_reader :y
    attr_reader :relative_x
    attr_reader :relative_y
    attr_reader :click
    attr_reader :click_at
    attr_reader :global_click_at
    attr_reader :previous_click
    attr_reader :up
    attr_reader :up_at
    attr_reader :global_up_at
    alias down click
    alias down_at click_at
    alias global_down_at global_click_at
    attr_reader :w
    attr_reader :h

    def held
    end

    def held_at
    end

    def global_held_at
    end

    def buffered_click
    end

    def buffered_duration_threshold
    end

    def buffered_distance_threshold
    end

    def held_duration
    end

    def buffered_held
    end
  end

  class MouseKeys
    attr_reader :left
    attr_reader :middle
    attr_reader :right
    attr_reader :x1
    attr_reader :x2
  end
end
