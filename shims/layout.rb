# noinspection RubyUnusedLocalVariable
module GTK
  # Provides APIs for placing primitives on a virtual grid within the "safe area" across all platforms.
  # Useful for rendering static controls like buttons, menu items, configuration screens, etc.
  # All functions are available globally via Layout.* or through args.layout
  class Layout
    # Returns a Hash with properties x, y, w, h, and center (which contains a Hash with x, y).
    # The virtual grid is 12 rows by 24 columns (or 24 columns by 12 rows in portrait mode).
    #
    # Parameters:
    #   row: Row position in the grid (0-11)
    #   col: Column position in the grid (0-23)
    #   w: Width in grid cells (default: 1)
    #   h: Height in grid cells (default: 1)
    #   row_from_bottom: Alternative to row, counting from bottom
    #   col_from_right: Alternative to col, counting from right
    #   max_width: Maximum width constraint
    #   max_height: Maximum height constraint
    #   dx: X offset in pixels
    #   dy: Y offset in pixels
    #   include_row_gutter: Whether to include row gutter
    #   include_col_gutter: Whether to include column gutter
    #   merge: Hash to merge with result
    #   origin: Origin point (:top_left default)
    #   safe_area: Whether to respect safe area (default: true)
    #
    # Example:
    #   # Create a button centered in the grid
    #   button_rect = args.layout.rect(row: 6, col: 10, w: 4, h: 2)
    #   
    #   # Render a button at that position
    #   args.outputs.sprites << button_rect.merge(path: :solid, r: 100, g: 100, b: 200)
    #   args.outputs.labels << button_rect.center.merge(
    #     text: "Click Me",
    #     anchor_x: 0.5,
    #     anchor_y: 0.5
    #   )
    def rect(row: 0, col: 0,
             w: 1, h: 1,
             row_from_bottom: nil, col_from_right: nil,
             max_width: nil, max_height: nil,
             dx: 0, dy: 0, include_row_gutter: false, include_col_gutter: false,
             merge: nil,
             origin: :top_left, safe_area: true) end

    # Returns an array of primitives that can be rendered to the screen
    # to help visualize the grid for positioning elements.
    #
    # Example:
    #   # Display the grid overlay to help with positioning
    #   args.outputs.primitives << args.layout.debug_primitives
    def debug_primitives(invert_colors: false) end

    # Returns true if the game is in landscape orientation.
    # Alias for Grid.landscape?
    def landscape?
    end

    # Returns true if the game is in portrait orientation.
    # Alias for Grid.portrait?
    def portrait?
    end
  end
end
