# noinspection RubyUnusedLocalVariable
module GTK
  # Contains methods for calculations that are frequently used in game development.
  # Most functions are mixed into Hash, Array, and DragonRuby's Entity class.
  module Geometry
    # Returns true if the rectangle (self) is inside the outer rectangle.
    #
    # Example:
    #   # Check if a smaller rectangle is inside a larger one
    #   small_rect = { x: 10, y: 10, w: 20, h: 20 }
    #   large_rect = { x: 0, y: 0, w: 100, h: 100 }
    #   small_rect.inside_rect?(large_rect) # => true
    def inside_rect?(outer, tolerance = 0.0) end

    # Returns true if the rectangle (self) intersects with another rectangle.
    # An optional tolerance parameter can be passed (default is 0.1).
    #
    # Example:
    #   rect_1 = { x: 0, y: 0, w: 100, h: 100 }
    #   rect_2 = { x: 50, y: 50, w: 100, h: 100 }
    #   rect_1.intersects_rect?(rect_2) # => true
    def intersects_rect?(*args) end

    # Returns a new rectangle with scaled dimensions.
    # You can independently control the scale of each axis with named parameters.
    #
    # Example:
    #   rect = { x: 640 - 20, y: 360 - 20, w: 40, h: 40 }
    #   # Double width, half height, anchored from center
    #   rect.scale_rect_extended(percentage_x: 2, 
    #                           percentage_y: 0.5,
    #                           anchor_x: 0.5,
    #                           anchor_y: 0.5)
    def scale_rect_extended(percentage_x: percentage_x, percentage_y: percentage_y, anchor_x: anchor_x, anchor_y: anchor_y) end

    # Returns a new rectangle with scaled dimensions.
    # 
    # Example:
    #   rect = { x: 640 - 20, y: 360 - 20, w: 40, h: 40 }
    #   # Half the size with the x and y position unchanged
    #   rect.scale_rect(0.5)
    #   # Double the size, repositioned from the center
    #   rect.scale_rect(2, 0.5, 0.5)
    def scale_rect(percentage, *anchors) end

    # Returns an angle in degrees to the end_point from self.
    #
    # Example:
    #   start = { x: 0, y: 0 }
    #   target = { x: 100, y: 100 }
    #   start.angle_to(target) # Returns 45 degrees
    def angle_to(other_point) end

    # Returns an angle in degrees from the end_point to self.
    #
    # Example:
    #   start = { x: 0, y: 0 }
    #   target = { x: 100, y: 100 }
    #   start.angle_from(target) # Returns 225 degrees
    def angle_from(other_point) end

    # Returns true if the point (self) is inside a circle defined by 
    # a center point and radius.
    #
    # Example:
    #   point = { x: 10, y: 10 }
    #   circle_center = { x: 0, y: 0 }
    #   point.point_inside_circle?(circle_center, 20) # => true
    def point_inside_circle?(circle_center_point, radius = nil) end

    # Centers self inside the given rectangle and returns the new rectangle.
    #
    # Example:
    #   rect_1 = { x: 0, y: 0, w: 100, h: 100 }
    #   rect_2 = { x: 640 - 100, y: 360 - 100, w: 200, h: 200 }
    #   rect_1.center_inside_rect(rect_2) # Returns centered rect
    def center_inside_rect(other_rect) end

    # Centers self horizontally inside the given rectangle.
    def center_inside_rect_x(other_rect) end

    # Centers self vertically inside the given rectangle.
    def center_inside_rect_y(other_rect) end

    # Returns a new rect that is anchored by the given anchor_x and anchor_y values.
    # 
    # Example:
    #   rect = { x: 640, y: 360, w: 100, h: 100 }
    #   # Center the rect (x,y becomes the center point)
    #   rect.anchor_rect(0.5, 0.5)
    def anchor_rect(anchor_x, anchor_y) end

    # Legacy method, use angle_to instead.
    def angle_given_point(other_point) end

    # Converts a line to a rectangle.
    def line_to_rect(min_w: 0, min_h: 0) end

    # Converts a rectangle to a line.
    def rect_to_line
    end

    # Returns the center point of the rectangle.
    #
    # Example:
    #   rect = { x: 100, y: 100, w: 100, h: 100 }
    #   rect.rect_center_point # Returns { x: 150, y: 150 }
    def rect_center_point
    end

    # Given a point and an angle in degrees, returns a new point rotated around
    # the origin (or an optional point) by the angle.
    #
    # Example:
    #   point = { x: 100, y: 100 }
    #   # Rotate around origin
    #   Geometry.rotate_point(point, 90)
    #   # Rotate around center of screen
    #   Geometry.rotate_point(point, 90, { x: 640, y: 360 })
    def self.rotate_point(point, angle, around = nil) end

    # Calculates a point on a cubic bezier curve at parameter t.
    def self.cubic_bezier(t, a, b, c, d) end

    # Class method version of scale_rect.
    def self.scale_rect(rect, percentage, *anchors) end

    # Class method version of rect_to_line.
    def self.rect_to_line(rect) end

    # Class method version of center_inside_rect.
    def self.center_inside_rect(rect, other_rect) end

    # Class method version of center_inside_rect_x.
    def self.center_inside_rect_x(rect, other_rect) end

    # Class method version of center_inside_rect_y.
    def self.center_inside_rect_y(rect, other_rect) end

    # Shifts a line by x and y amount.
    def self.shift_line(line, x, y) end

    # Class method version of intersects_rect?.
    def self.intersects_rect?(*args) end

    # Calculates the y-intercept of a line.
    def self.line_y_intercept(line, replace_infinity: nil) end

    # Returns the smallest angle delta between two angles in degrees.
    #
    # Example:
    #   Geometry.angle_delta(350, 10) # Returns 20
    def self.angle_delta(angle_one, angle_two) end

    # Returns true if test_angle is within range degrees of target_angle.
    #
    # Example:
    #   Geometry.angle_within_range?(95, 90, 10) # Returns true
    def self.angle_within_range?(test_angle, target_angle, range) end

    # Calculates the angle between two lines.
    def self.angle_between_lines(line_one, line_two, replace_infinity: nil) end

    # Calculates the slope of a line.
    def self.line_slope(line, replace_infinity = nil) end

    # Returns a normalized representation of the rise and run of the line.
    #
    # Example:
    #   line = { x: 0, y: 0, x2: 1280, y2: 720 }
    #   Geometry.line_rise_run(line) # Returns normalized rise/run
    def self.line_rise_run(line) end

    # Tests if a point is left, right, or on a line.
    # Returns one of the following symbols: :left, :right, :on
    #
    # Example:
    #   point = { x: 100, y: 100 }
    #   line = { x: 0, y: 0, x2: 1280, y2: 720 }
    #   Geometry.ray_test(point, line) # Returns position relative to line
    def self.ray_test(point, line) end

    # Converts a line to a rectangle.
    def self.line_to_rect(line, min_w: 0, min_h: 0) end

    # Alias for line_to_rect.
    def self.line_rect(line, min_w: 0, min_h: 0) end

    # Returns the point of intersection between two infinite lines.
    # Returns nil if the lines are parallel.
    #
    # Example:
    #   line_1 = { x: 0, y: 0, x2: 1280, y2: 720 }
    #   line_2 = { x: 0, y: 720, x2: 1280, y2: 0 }
    #   Geometry.ray_intersect(line_1, line_2) # Returns intersection point
    def self.ray_intersect(line_one, line_two) end

    # Returns the point of intersection between two line segments.
    # Returns nil if the segments don't intersect.
    #
    # Example:
    #   line_1 = { x: 0, y: 0, x2: 1280, y2: 720 }
    #   line_2 = { x: 0, y: 720, x2: 1280, y2: 0 }
    #   Geometry.line_intersect(line_1, line_2) # Returns intersection point
    def self.line_intersect(line_one, line_two) end

    # Creates a square with the given size at x,y with optional anchoring.
    def self.to_square(size, x, y, anchor_x = 0.5, anchor_y = nil) end

    # Returns the distance between two points.
    #
    # Example:
    #   point_1 = { x: 0, y: 0 }
    #   point_2 = { x: 100, y: 100 }
    #   Geometry.distance(point_1, point_2) # Returns distance
    def self.distance(point_one, point_two) end

    # Returns 1 or -1 depending on which direction is the shortest way
    # to turn from one angle to another.
    def self.angle_turn_direction(angle, target_angle) end

    # Returns an angle in degrees from the start_point to the end_point.
    #
    # Example:
    #   start = { x: 0, y: 0 }
    #   target = { x: 100, y: 100 }
    #   Geometry.angle(start, target) # Returns 45 degrees
    def self.angle(start_point, end_point) end

    # Returns an angle in degrees from the end_point to the start_point.
    def self.angle_from(start_point, end_point) end

    # Returns an angle in degrees from the start_point to the end_point.
    # Alias for angle.
    def self.angle_to(start_point, end_point) end

    # Returns true if a point is inside a circle.
    def self.point_inside_circle?(point, circle_center_point, radius = nil) end

    # Returns true if inner_rect is inside outer_rect.
    def self.inside_rect?(inner_rect, outer_rect, tolerance = 0.0) end

    # Class method version of scale_rect_extended.
    def self.scale_rect_extended(rect, percentage_x: nil, percentage_y: nil, anchor_x: nil, anchor_y: nil) end

    # Returns the center point of a rectangle.
    def self.rect_center_point(rect) end

    # Returns the center point of a line.
    def self.line_center_point(line) end

    # Returns the length of a line.
    def self.line_length(line) end

    # Returns the center point of a rectangle or line.
    def self.center(rect_or_line) end

    # Returns a hash containing the normalized rectangle properties
    # with anchor_x and anchor_y taken into account.
    #
    # Example:
    #   rect = { x: 100, y: 100, w: 100, h: 100, anchor_x: 0.5, anchor_y: 0.5 }
    #   Geometry.rect_props(rect) # Returns normalized rectangle
    def self.rect_props(r) end

    class << self
      alias_method :rect_normalize, :rect_props
    end

    # Returns true if a line is horizontal.
    def self.line_horizontal?(line) end
  end
end
