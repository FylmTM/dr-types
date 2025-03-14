# noinspection RubyUnusedLocalVariable
class Numeric
  # Returns a random number. Supports various parameter forms:
  # - No arguments: Returns a random float between 0.0 and 1.0
  # - Numeric argument: Returns a random integer between 0 and the number (exclusive)
  # - Range argument: Returns a random value within the range (inclusive)
  #
  # Example:
  #   Numeric.rand        # => 0.123 (random float between 0.0 and 1.0)
  #   Numeric.rand(10)    # => 7 (random integer between 0 and 10)
  #   Numeric.rand(1..10) # => 5 (random integer between 1 and 10)
  def self.rand
  end

  # Class method version of frame_index without repeating animation
  def self.frame_index_no_repeat(start_at: 0, count: nil, frame_count: nil, hold_for: 1, tick_count_override: Kernel.tick_count, **ignored) end

  # Class method for determining the index of frame-by-frame sprite animation.
  # 
  # Parameters:
  #   start_at: Frame when animation started
  #   count/frame_count: Number of frames in animation
  #   hold_for: How long to show each frame
  #   repeat: Whether animation should loop
  #   tick_count_override: Custom tick count
  #   repeat_index: Frame to restart from when looping
  #
  # Example:
  #   sprite_index = Numeric.frame_index(start_at: 0, 
  #                                      count: 6,
  #                                      hold_for: 4,
  #                                      repeat: true)
  def self.frame_index(start_at: 0, count: nil, frame_count: nil, hold_for: 1, repeat: false, tick_count_override: Kernel.tick_count, repeat_index: 0) end

  # Layout conversion helpers
  def to_layout_row(opts = {}) end
  def to_layout_col(opts = {}) end
  def to_layout_w
  end
  def to_layout_h
  end
  def to_layout_row_from_bottom(opts = {}) end
  def to_layout_col_from_right(opts = {}) end

  # Utility methods for common values
  def seconds
  end
  def half
  end
  def third
  end
  def quarter
  end
  def to_byte
  end

  # Restricts a value to be between min and max
  #
  # Example:
  #   100.clamp(0, 50) # => 50
  def clamp(min, max = nil) end

  # Clamps a value between min and max, but wraps around boundaries
  #
  # Example:
  #   100.clamp_wrap(0, 50) # => 49
  def clamp_wrap(min, max) end

  # Returns the number of frames that have elapsed since self.
  # Useful for timing operations.
  #
  # Example:
  #   start_time = Kernel.tick_count
  #   # Later...
  #   if start_time.elapsed_time > 120
  #     # More than 2 seconds have passed
  #   end
  def elapsed_time(tick_count_override = nil) end

  # Returns elapsed time as a percentage of the given duration
  def elapsed_time_percent(duration) end

  # Returns true if the elapsed time is greater than the number + offset
  #
  # Example:
  #   destroy_at = Kernel.tick_count + 60
  #   # Later...
  #   if destroy_at.elapsed?
  #     # It's time to destroy
  #   end
  def elapsed?(offset = 0, tick_count_override = Kernel.tick_count) end

  # Returns true if it's a new frame since self
  def new?(tick_count_override = Kernel.tick_count) end

  # Determines the index of frame-by-frame sprite animation.
  # The numeric value (self) represents when the animation started.
  #
  # Parameters:
  #   frame_count: Number of frames in the animation
  #   hold_for: How long to show each frame
  #   repeat: Whether the animation should loop
  #
  # Example:
  #   start_looping_at = 0
  #   sprite_index = start_looping_at.frame_index(6, 4, true)
  def frame_index(frame_count, hold_for, repeat, tick_count_override = Kernel.tick_count) end

  # Positional helpers
  def shift_right(i) end
  def shift_left(i) end
  def shift_up(i) end
  def shift_down(i) end

  # Random value generation helpers
  def randomize(*definitions) end
  def rand_sign
  end
  def rand_ratio
  end

  # Returns the remainder of dividing by n
  def remainder_of_divide(n) end

  # Easing function helpers
  def ease_extended(tick_count_override, duration, default_before, default_after, *definitions) end
  def global_ease(duration, *definitions) end
  def ease(duration, *definitions) end
  def ease_spline_extended(tick_count_override, duration, spline) end
  def global_ease_spline(duration, spline) end
  def ease_spline(duration, spline) end

  # Converts degrees to radians
  def to_radians
  end

  # Converts radians to degrees
  def to_degrees
  end

  # Creates a square with this size at the given coordinates
  def to_square(x, y, anchor_x = 0.5, anchor_y = nil) end

  # Vector calculation helpers
  def vector(max_value = 1) end
  def to_vector_r(max_value = 1) end

  # Returns the x vector component for this angle in radians
  def vector_x_r(max_value = 1) end

  # Returns the y vector component for this angle in radians
  def vector_y_r(max_value = 1) end

  def to_vector(max_value = 1) end

  # Returns the y vector component for this angle in degrees
  #
  # Example:
  #   33.vector_y # => 0.54 (approximately)
  def vector_y(max_value = 1) end

  # Returns the x vector component for this angle in degrees
  #
  # Example:
  #   33.vector_x # => 0.83 (approximately)
  def vector_x(max_value = 1) end

  # Aliases for vector methods
  alias vector_x_d vector_x
  alias vector_y_d vector_y
  alias to_vector_d to_vector

  # Alternative vector component methods
  def x_vector(max_value = 1) end
  def y_vector(max_value = 1) end

  # Returns the modulo of this number by n
  def mod(n) end

  # Returns true if this number is divisible by any of the given numbers
  def mod_zero?(*ns) end

  # Returns true if this number modulo n is zero
  #
  # Example:
  #   60.zmod?(6) # => true
  def zmod?(n) end

  # Multiplication helpers
  def multiply(n) end
  def fmult(n) end
  def imult(n) end
  def mult(n) end

  # Performs integer division
  #
  # Example:
  #   5.0.idiv(3) # => 1
  def idiv(n) end

  # Adjusts the value towards the target by the given magnitude
  def towards(target, magnitude) end

  # Linear interpolation towards a target value
  #
  # Example:
  #   10.lerp(20, 0.5) # => 15
  def lerp(to, step) end

  # Remaps a value from one range to another
  #
  # Example:
  #   5.remap(0, 10, 0, 100) # => 50
  def remap(r1_begin, r1_end, r2_begin, r2_end) end

  # Applies block to each element in range with given y-values
  def map_with_ys(ys, &block) end

  # Returns combinations of this number with other_int
  def combinations(other_int) end

  # Returns this number as a percentage of n
  def percentage_of(n) end

  # Caps this number at i if it's greater than i
  def cap(i) end

  # Caps this number between min and max
  def cap_min_max(min, max) end

  # Returns the lesser of this number and other
  def lesser(other) end

  # Returns the greater of this number and other
  def greater(other) end

  # Subtraction helpers
  def subtract(i) end
  def minus(i) end

  # Addition helpers
  def add(i) end
  def plus(i) end

  # Returns array of numbers from 0 to self-1
  def numbers
  end

  # Iteration methods
  def each(&block) end
  def each_with_index(&block) end

  # Returns array of results from applying block to each number in range
  #
  # Example:
  #   5.map { |i| i * 2 } # => [0, 2, 4, 6, 8]
  def map(&block) end

  def map_with_index(&block) end
  def times_with_index(&block) end
  def flat_map(&block) end

  # Returns self
  def serialize
  end

  # Position calculation helpers from screen edges
  def self.from_top(n) end
  def from_top
  end
  def self.from_right(n) end
  def from_right
  end

  # Class method version of clamp
  def self.clamp(n, min, max) end

  # Returns true if this number is between l and r
  def mid?(l, r) end

  def self.from_left(n) end
  def from_left
  end
  def self.from_bottom(n) end
  def from_bottom
  end
end

# noinspection RubyUnusedLocalVariable
class Fixnum
  # Returns true if this number is even
  def even?
  end

  # Returns true if this number is odd
  def odd?
  end

  # Returns the sign of this number (1, 0, or -1)
  def sign
  end

  # Returns true if this number is positive
  def pos?
  end

  # Returns true if this number is negative
  def neg?
  end

  # Trigonometric functions (degrees, radians, and conversions)
  def cos
  end
  def cos_r
  end
  def cos_d
  end
  def sin
  end
  def sin_r
  end
  def sin_d
  end
  def tan
  end
  def tan_d
  end
  def tan_r
  end

  # Returns a string float representation with two decimal places
  #
  # Example:
  #   5.8778.to_sf # => "5.88"
  def to_sf
  end

  # Returns a string integer with underscores as thousands separators
  #
  # Example:
  #   50000.to_si # => "50_000"
  def to_si
  end

  # Integer floor division
  def ifloor(int) end
end

# noinspection RubyUnusedLocalVariable
class Float
  # Returns the sign of this float (1.0, 0.0, or -1.0)
  def sign
  end

  # Replaces infinity with the given scalar value
  def replace_infinity(scalar) end

  # Returns a string float representation with two decimal places
  #
  # Example:
  #   5.8778.to_sf # => "5.88"
  def to_sf
  end

  # Integer floor division
  def ifloor(int) end

  # Trigonometric functions (degrees, radians, and conversions)
  def sin
  end
  def cos
  end
  def sin_r
  end
  def sin_d
  end
  def cos_r
  end
  def cos_d
  end
  def tan
  end
  def tan_d
  end
  def tan_r
  end
end

# noinspection RubyUnusedLocalVariable
class Integer
  # Returns true if this integer is NaN
  def nan?
  end

  # Returns the center point between this integer and other
  def center(other) end
end
