# noinspection RubyUnusedLocalVariable
module GTK
  # Provides information about the screen and game canvas.
  # All functions are available globally via Grid.* or through args.grid
  class Grid
    # Returns either :landscape (default) or :portrait
    # The orientation of your game is set within ./mygame/metadata/game_metadata.txt
    attr_reader :orientation
    
    # Returns either :bottom_left (default) or :center
    attr_reader :origin_name
    
    # X coordinate of the grid origin (logical scale)
    attr_reader :x
    
    # X coordinate of the grid origin (pixel scale)
    attr_reader :x_px
    
    # Y coordinate of the grid origin (logical scale)
    attr_reader :y
    
    # Y coordinate of the grid origin (pixel scale)
    attr_reader :y_px
    
    # Width of the grid (logical scale, 1280 for landscape)
    attr_reader :w
    
    # Width of the grid in pixels
    attr_reader :w_px
    
    # Height of the grid (logical scale, 720 for landscape)
    attr_reader :h
    
    # Height of the grid in pixels
    attr_reader :h_px
    
    # Left edge of the grid (logical scale)
    attr_reader :left
    
    # Left edge of the grid in pixels
    attr_reader :left_px
    
    # Right edge of the grid (logical scale)
    attr_reader :right
    
    # Right edge of the grid in pixels
    attr_reader :right_px
    
    # Top edge of the grid (logical scale)
    attr_reader :top
    
    # Top edge of the grid in pixels
    attr_reader :top_px
    
    # Bottom edge of the grid (logical scale)
    attr_reader :bottom
    
    # Bottom edge of the grid in pixels
    attr_reader :bottom_px
    
    # Center X coordinate of the grid (logical scale)
    attr_reader :center_x
    
    # Center X coordinate of the grid in pixels
    attr_reader :center_x_px
    
    # Center Y coordinate of the grid (logical scale)
    attr_reader :center_y
    
    # Center Y coordinate of the grid in pixels
    attr_reader :center_y_px
    
    # Rectangle that represents the grid (logical scale)
    attr_reader :rect
    
    # Rectangle that represents the grid in pixels
    attr_reader :rect_px
    
    # Center point of the grid
    attr_reader :center
    
    # Returns either 16 or 9 based on orientation
    attr_reader :aspect_ratio_w
    
    # Returns either 9 or 16 based on orientation
    attr_reader :aspect_ratio_h
    
    # X origin of the grid (logical scale)
    attr_reader :origin_x
    
    # X origin of the grid in pixels
    attr_reader :origin_x_px
    
    # Y origin of the grid (logical scale)
    attr_reader :origin_y
    
    # Y origin of the grid in pixels
    attr_reader :origin_y_px
    
    # All screen properties (Pro License features)
    # Left edge of the all screen area (logical scale)
    attr_reader :allscreen_left
    
    # Left edge of the all screen area in pixels
    attr_reader :allscreen_left_px
    
    # Right edge of the all screen area (logical scale)
    attr_reader :allscreen_right
    
    # Right edge of the all screen area in pixels
    attr_reader :allscreen_right_px
    
    # Top edge of the all screen area (logical scale)
    attr_reader :allscreen_top
    
    # Top edge of the all screen area in pixels
    attr_reader :allscreen_top_px
    
    # Bottom edge of the all screen area (logical scale)
    attr_reader :allscreen_bottom
    
    # Bottom edge of the all screen area in pixels
    attr_reader :allscreen_bottom_px
    
    # Width of the all screen area (logical scale)
    attr_reader :allscreen_w
    
    # Width of the all screen area in pixels
    attr_reader :allscreen_w_px
    
    # Width of the all screen area in points
    attr_reader :allscreen_w_pt
    
    # Height of the all screen area (logical scale)
    attr_reader :allscreen_h
    
    # Height of the all screen area in pixels
    attr_reader :allscreen_h_px
    
    # Height of the all screen area in points
    attr_reader :allscreen_h_pt
    
    # X offset of the all screen area (logical scale)
    attr_reader :allscreen_offset_x
    
    # X offset of the all screen area in pixels
    attr_reader :allscreen_offset_x_px
    
    # Y offset of the all screen area (logical scale)
    attr_reader :allscreen_offset_y
    
    # Y offset of the all screen area in pixels
    attr_reader :allscreen_offset_y_px
    
    # Native scale compared to 720p
    attr_reader :native_scale
    
    # Render scale compared to 720p
    attr_reader :render_scale
    
    # Decimal value representing the rendering scale for textures as a float
    attr_reader :texture_scale
    
    # Integer value representing the rendering scale of the game at a best-fit value
    attr_reader :texture_scale_enum

    # Change the grid's coordinate system where 0,0 is at the bottom left corner.
    # origin_name will be set to :bottom_left.
    #
    # Example:
    #   args.grid.origin_bottom_left!
    def origin_bottom_left!(force: false)
    end

    # Change the grid's coordinate system where 0,0 is at the center of the screen.
    # origin_name will be set to :center.
    #
    # Example:
    #   args.grid.origin_center!
    def origin_center!(force: false)
    end

    # Returns true if orientation is :landscape.
    #
    # Example:
    #   if args.grid.landscape?
    #     # Handle landscape orientation
    #   end
    def landscape?
    end

    # Returns true if orientation is :portrait.
    #
    # Example:
    #   if args.grid.portrait?
    #     # Handle portrait orientation
    #   end
    def portrait?
    end
  end
end
