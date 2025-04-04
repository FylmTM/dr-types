# noinspection RubyUnusedLocalVariable
module GTK
  # Outputs is how you render primitives to the screen.
  # Access through +args.outputs+ in your game code.
  class Outputs
    # Width of the output
    attr_accessor :width

    # Height of the output
    attr_accessor :height

    # Aliases for width and height
    alias :w :width
    alias :h :height

    # Background color for the output
    # Can be set with a hash: {r: 255, g: 255, b: 255, a: 255}
    attr_accessor :background_color

    # Whether to clear the screen before rendering
    attr_accessor :clear_before_render

    # Collection for rendering solid rectangles to the screen.
    # Primitives are rendered first-in, first-out in the solids layer (lowest rendering layer).
    #
    # Usage:
    #   args.outputs.solids << { x: 0, y: 0, w: 100, h: 100 }
    #   args.outputs.solids << { x: 0, y: 0, w: 100, h: 100, r: 255, g: 255, b: 255, a: 128 }
    #   args.outputs.solids << [100, 100, 160, 90]
    #   args.outputs.solids << [100, 100, 160, 90, 0, 255, 0, 128]
    #
    # Note: This is fine for sparingly use. For large numbers of solids, use sprites instead
    # as the textures generated by solid primitives are not cached.
    #
    # Hash properties:
    #   x, y: Position coordinates (origin at bottom left)
    #   w, h: Width and height
    #   r, g, b: RGB color values (0-255, default is 255 for each)
    #   a: Alpha/transparency (0-255, default is 255)
    #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
    #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
    #
    # Array format:
    #   [x, y, width, height]
    #   [x, y, width, height, red, green, blue, alpha]
    attr_reader :solids

    # Collection for rendering sprites (images) to the screen.
    # Primitives are rendered first-in, first-out in the sprites layer (second rendering layer).
    #
    # Usage:
    #   args.outputs.sprites << { x: 100, y: 100, w: 100, h: 100, path: "sprites/square/blue.png" }
    #   args.outputs.sprites << [100, 100, 160, 90, "sprites/circle/white.png"]
    #
    # Required Hash properties:
    #   x, y: Position coordinates (origin at bottom left)
    #   w, h: Width and height
    #   path: File path to the sprite image, or :solid for a solid rectangle
    #
    # Optional Hash properties:
    #   r, g, b: RGB color values (0-255, default is 255 for each)
    #   a: Alpha/transparency (0-255, default is 255)
    #   flip_horizontally, flip_vertically: Boolean values to flip sprite (default is false)
    #   angle: Rotation of sprite in degrees (default is 0)
    #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
    #   angle_anchor_x, angle_anchor_y: Rotation anchors (0-1)
    #   tile_x, tile_y, tile_w, tile_h: Define crop area (origin at top left)
    #   source_x, source_y, source_w, source_h: Define crop area (origin at bottom left)
    #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
    #   scale_quality_enum: Scaling quality (0: nearest, 1: linear, 2: anti-alias)
    #
    # Triangle rendering:
    #   Instead of w, h, provide x2, y2, x3, y3 coordinates for triangle vertices
    #   For cropping triangles, use source_x2, source_y2, source_x3, source_y3
    #
    # Array format:
    #   [x, y, width, height, path]
    attr_reader :sprites

    # Collection for rendering lines to the screen.
    # Primitives are rendered first-in, first-out in the lines layer (5th rendering layer).
    #
    # Usage:
    #   args.outputs.lines << { x: 300, y: 300, x2: 400, y2: 400 }
    #   args.outputs.lines << [100, 100, 150, 150]
    #
    # Hash properties:
    #   x, y: Start position coordinates
    #   x2, y2: End position coordinates
    #   r, g, b: RGB color values (0-255, default is 0 for each)
    #   a: Alpha/transparency (0-255, default is 255)
    #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
    #
    # Array format:
    #   [x, y, x2, y2]
    #   [x, y, x2, y2, red, green, blue, alpha]
    attr_reader :lines

    # Collection for rendering text labels to the screen.
    # Primitives are rendered first-in, first-out in the labels layer (4th rendering layer).
    #
    # Usage:
    #   args.outputs.labels << { x: 200, y: 200, text: "Hello World" }
    #   args.outputs.labels << [175, 610, "Smaller label.", 0]
    #
    # Hash properties:
    #   x, y: Position coordinates (origin at bottom left)
    #   text: The text to display
    #   size_enum: Font size (-n for smaller, 0 default, +n for larger)
    #   size_px: Explicit font size in pixels (overrides size_enum if provided)
    #   alignment_enum: Text alignment (0: left, 1: center, 2: right)
    #   vertical_alignment_enum: Vertical alignment (0: bottom, 1: center, 2: top)
    #   r, g, b: RGB color values (0-255, default is 0 for each)
    #   a: Alpha/transparency (0-255, default is 255)
    #   font: Path to font file (optional)
    #   anchor_x, anchor_y: Position anchors (0-1, defaults to alignment settings)
    #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
    #
    # Array format:
    #   [x, y, text, size_enum, alignment_enum, r, g, b, a, font]
    attr_reader :labels

    # Collection for rendering unfilled rectangles (borders) to the screen.
    # Primitives are rendered first-in, first-out in the borders layer (6th/top rendering layer).
    #
    # Usage:
    #   args.outputs.borders << { x: 0, y: 0, w: 100, h: 100 }
    #   args.outputs.borders << [100, 100, 160, 90]
    #
    # Hash properties:
    #   x, y: Position coordinates (origin at bottom left)
    #   w, h: Width and height
    #   r, g, b: RGB color values (0-255, default is 255 for each)
    #   a: Alpha/transparency (0-255, default is 255)
    #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
    #   blendmode_enum: Blending mode
    #
    # Array format:
    #   [x, y, width, height]
    #   [x, y, width, height, red, green, blue, alpha]
    #
    # Note: Borders are similar to solids, but render as unfilled rectangles.
    attr_reader :borders

    # Collection for rendering any type of primitive to the screen.
    # Allows bypassing the default rendering order to control primitive layering.
    # Primitives are rendered first-in, first-out in the primitives layer (3rd rendering layer).
    #
    # Usage:
    #   # Sprite
    #   args.outputs.primitives << { x: 100, y: 100, w: 100, h: 100, path: "sprites/square/blue.png" }
    #
    #   # Solid (requires primitive_marker)
    #   args.outputs.primitives << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :solid }
    #
    #   # Border (requires primitive_marker)
    #   args.outputs.primitives << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :border }
    #
    #   # Label
    #   args.outputs.primitives << { x: 100, y: 100, text: "hello world" }
    #
    #   # Line
    #   args.outputs.primitives << { x: 100, y: 100, x2: 150, y2: 150 }
    #
    # Note:
    # - This collection accepts any primitive type
    # - For non-sprite primitives, you must specify the primitive_marker (:solid, :border, etc.)
    # - Labels and lines automatically set the appropriate primitive_marker
    # - Useful for custom rendering orders, like rendering solids on top of sprites
    attr_reader :primitives

    # Collection for rendering debug primitives (not visible in production builds).
    # Renders above all other layers and is intended for development/debugging use only.
    # Primitives are rendered first-in, first-out in the debug layer.
    #
    # Usage:
    #   args.outputs.debug << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :solid }
    #   args.outputs.debug << "current tick: #{Kernel.tick_count}"
    #   args.outputs.debug << "player x: #{args.state.player.x}"
    #   args.outputs.debug.watch args.state.player
    #
    # Features:
    # 1. Accepts any primitive type (similar to +args.outputs.primitives+)
    # 2. String primitives are automatically converted to labels with black text and white background
    # 3. Strings are automatically stacked vertically, with newlines respected
    # 4. The watch method provides additional control for displaying object values
    #
    # Watch method parameters:
    #   object: The object to convert to a string and display
    #   label_style: Optional hash to override label styling
    #   background_style: Optional hash to override background styling
    #
    # Example:
    #   args.outputs.debug.watch args.state.player
    #   args.outputs.debug.watch "Score: #{score}",
    #                            label_style: { r: 0, g: 0, b: 255, size_px: 10 },
    #                            background_style: { r: 0, g: 255, b: 0, a: 128, path: :solid }
    attr_reader :debug

    # Static collections persist between frames (don't need to be added every tick)
    # See: SolidsOutputsArray
    attr_reader :static_solids

    # Static collections persist between frames (don't need to be added every tick)
    # See: SpritesOutputsArray
    attr_reader :static_sprites

    # Static collections persist between frames (don't need to be added every tick)
    # See: LinesOutputsArray
    attr_reader :static_lines

    # Static collections persist between frames (don't need to be added every tick)
    # See: LabelsOutputsArray
    attr_reader :static_labels

    # Static collections persist between frames (don't need to be added every tick)
    # See: BordersOutputsArray
    attr_reader :static_borders

    # Static collections persist between frames (don't need to be added every tick)
    # See: PrimitivesOutputsArray
    attr_reader :static_primitives

    # Static collections persist between frames (don't need to be added every tick)
    # See: DebugOutputsArray
    attr_reader :static_debug

    # Collection of sounds to play
    # Example:
    #   args.outputs.sounds << "sounds/explosion.wav"
    attr_reader :sounds

    # Collection of screenshot requests
    # Example:
    #   args.outputs.screenshots << {x: 0, y: 0, w: 1280, h: 720, path: "screenshot.png"}
    attr_reader :screenshots

    # Accessibility features
    attr_reader :a11y

    # Returns true if screenshots are supported
    def can_screenshot?
    end

    # Resets all primitives
    def reset
    end

    # Clears all primitives
    def clear
    end

    include WatchLabels
  end

  # Module for watching variables in debug mode
  module WatchLabels
    # Displays a variable in debug mode with optional styling
    #
    # Example:
    #   args.outputs.debug.watch args.state.player
    #   args.outputs.debug.watch "Score: #{score}", 
    #                            label_style: {r: 0, g: 255, b: 0},
    #                            background_style: {r: 0, g: 0, b: 0, a: 128}
    def watch(object, label_style: nil, background_style: nil) end

    # Watches instance variables of an object
    def watch_ivars(object, label_style: nil, background_style: nil) end

    # Watches attributes of an object
    def watch_attrs(object, label_style: nil, background_style: nil) end

    # Displays current FPS in debug mode
    def watch_fps
    end
  end

  # Base class for outputs arrays
  class OutputsArray < Array
  end

  # Collection for rendering solid rectangles to the screen.
  # Primitives are rendered first-in, first-out in the solids layer (lowest rendering layer).
  #
  # Usage:
  #   args.outputs.solids << { x: 0, y: 0, w: 100, h: 100 }
  #   args.outputs.solids << { x: 0, y: 0, w: 100, h: 100, r: 255, g: 255, b: 255, a: 128 }
  #   args.outputs.solids << [100, 100, 160, 90]
  #   args.outputs.solids << [100, 100, 160, 90, 0, 255, 0, 128]
  #
  # Note: This is fine for sparingly use. For large numbers of solids, use sprites instead
  # as the textures generated by solid primitives are not cached.
  #
  # Hash properties:
  #   x, y: Position coordinates (origin at bottom left)
  #   w, h: Width and height
  #   r, g, b: RGB color values (0-255, default is 255 for each)
  #   a: Alpha/transparency (0-255, default is 255)
  #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
  #   blendmode_enum: Blending mode (default is 1)
  #
  # Array format:
  #   [x, y, width, height]
  #   [x, y, width, height, red, green, blue, alpha]
  class SolidsOutputsArray < OutputsArray
  end

  # Collection for rendering sprites (images) to the screen.
  # Primitives are rendered first-in, first-out in the sprites layer (second rendering layer).
  #
  # Usage:
  #   args.outputs.sprites << { x: 100, y: 100, w: 100, h: 100, path: "sprites/square/blue.png" }
  #   args.outputs.sprites << [100, 100, 160, 90, "sprites/circle/white.png"]
  #
  # Required Hash properties:
  #   x, y: Position coordinates (origin at bottom left)
  #   w, h: Width and height
  #   path: File path to the sprite image, or :solid for a solid rectangle
  #
  # Optional Hash properties:
  #   r, g, b: RGB color values (0-255, default is 255 for each)
  #   a: Alpha/transparency (0-255, default is 255)
  #   flip_horizontally, flip_vertically: Boolean values to flip sprite (default is false)
  #   angle: Rotation of sprite in degrees (default is 0)
  #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
  #   angle_anchor_x, angle_anchor_y: Rotation anchors (0-1)
  #   tile_x, tile_y, tile_w, tile_h: Define crop area (origin at top left)
  #   source_x, source_y, source_w, source_h: Define crop area (origin at bottom left)
  #   blendmode_enum: Blending mode (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
  #   scale_quality_enum: Scaling quality (0: nearest, 1: linear, 2: anti-alias)
  #
  # Triangle rendering:
  #   Instead of w, h, provide x2, y2, x3, y3 coordinates for triangle vertices
  #   For cropping triangles, use source_x2, source_y2, source_x3, source_y3
  #
  # Array format:
  #   [x, y, width, height, path]
  class SpritesOutputsArray < OutputsArray
  end

  # Collection for rendering text labels to the screen.
  # Primitives are rendered first-in, first-out in the labels layer (4th rendering layer).
  #
  # Usage:
  #   args.outputs.labels << { x: 200, y: 200, text: "Hello World" }
  #   args.outputs.labels << [175, 610, "Smaller label.", 0]
  #
  # Hash properties:
  #   x, y: Position coordinates (origin at bottom left)
  #   text: The text to display
  #   size_enum: Font size (-n for smaller, 0 default, +n for larger)
  #   size_px: Explicit font size in pixels (overrides size_enum if provided)
  #   alignment_enum: Text alignment (0: left, 1: center, 2: right)
  #   vertical_alignment_enum: Vertical alignment (0: bottom, 1: center, 2: top)
  #   r, g, b: RGB color values (0-255, default is 0 for each)
  #   a: Alpha/transparency (0-255, default is 255)
  #   font: Path to font file (optional)
  #   anchor_x, anchor_y: Position anchors (0-1, defaults to alignment settings)
  #   blendmode_enum: Blending mode
  #
  # Array format:
  #   [x, y, text, size_enum, alignment_enum, r, g, b, a, font]
  class LabelsOutputsArray < OutputsArray
  end

  # Collection for rendering unfilled rectangles (borders) to the screen.
  # Primitives are rendered first-in, first-out in the borders layer (6th/top rendering layer).
  #
  # Usage:
  #   args.outputs.borders << { x: 0, y: 0, w: 100, h: 100 }
  #   args.outputs.borders << [100, 100, 160, 90]
  #
  # Hash properties:
  #   x, y: Position coordinates (origin at bottom left)
  #   w, h: Width and height
  #   r, g, b: RGB color values (0-255, default is 255 for each)
  #   a: Alpha/transparency (0-255, default is 255)
  #   anchor_x, anchor_y: Position anchors (0-1, default is 0 for both)
  #   blendmode_enum: Blending mode
  #
  # Array format:
  #   [x, y, width, height]
  #   [x, y, width, height, red, green, blue, alpha]
  #
  # Note: Borders are similar to solids, but render as unfilled rectangles.
  class BordersOutputsArray < OutputsArray
  end

  # Collection for rendering lines to the screen.
  # Primitives are rendered first-in, first-out in the lines layer (5th rendering layer).
  #
  # Usage:
  #   args.outputs.lines << { x: 300, y: 300, x2: 400, y2: 400 }
  #   args.outputs.lines << [100, 100, 150, 150]
  #
  # Hash properties:
  #   x, y: Start position coordinates
  #   x2, y2: End position coordinates
  #   r, g, b: RGB color values (0-255, default is 0 for each)
  #   a: Alpha/transparency (0-255, default is 255)
  #   blendmode_enum: Blending mode
  #
  # Array format:
  #   [x, y, x2, y2]
  #   [x, y, x2, y2, red, green, blue, alpha]
  class LinesOutputsArray < OutputsArray
  end

  # Collection for rendering debug primitives (not visible in production builds).
  # Renders above all other layers and is intended for development/debugging use only.
  # Primitives are rendered first-in, first-out in the debug layer.
  #
  # Usage:
  #   args.outputs.debug << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :solid }
  #   args.outputs.debug << "current tick: #{Kernel.tick_count}"
  #   args.outputs.debug << "player x: #{args.state.player.x}"
  #   args.outputs.debug.watch args.state.player
  #
  # Features:
  # 1. Accepts any primitive type (similar to args.outputs.primitives)
  # 2. String primitives are automatically converted to labels with black text and white background
  # 3. Strings are automatically stacked vertically, with newlines respected
  # 4. The watch method provides additional control for displaying object values
  #
  # Watch method parameters:
  #   object: The object to convert to a string and display
  #   label_style: Optional hash to override label styling
  #   background_style: Optional hash to override background styling
  #
  # Example:
  #   args.outputs.debug.watch args.state.player
  #   args.outputs.debug.watch "Score: #{score}", 
  #                            label_style: { r: 0, g: 0, b: 255, size_px: 10 },
  #                            background_style: { r: 0, g: 255, b: 0, a: 128, path: :solid }
  class DebugOutputsArray < OutputsArray
    include WatchLabels
  end

  # Collection for rendering any type of primitive to the screen.
  # Allows bypassing the default rendering order to control primitive layering.
  # Primitives are rendered first-in, first-out in the primitives layer (3rd rendering layer).
  #
  # Usage:
  #   # Sprite
  #   args.outputs.primitives << { x: 100, y: 100, w: 100, h: 100, path: "sprites/square/blue.png" }
  #   
  #   # Solid (requires primitive_marker)
  #   args.outputs.primitives << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :solid }
  #   
  #   # Border (requires primitive_marker)
  #   args.outputs.primitives << { x: 0, y: 0, w: 100, h: 100, primitive_marker: :border }
  #   
  #   # Label
  #   args.outputs.primitives << { x: 100, y: 100, text: "hello world" }
  #   
  #   # Line
  #   args.outputs.primitives << { x: 100, y: 100, x2: 150, y2: 150 }
  #
  # Note:
  # - This collection accepts any primitive type
  # - For non-sprite primitives, you must specify the primitive_marker (:solid, :border, etc.)
  # - Labels and lines automatically set the appropriate primitive_marker
  # - Useful for custom rendering orders, like rendering solids on top of sprites
  class PrimitivesOutputsArray < OutputsArray
  end

  # See SolidsOutputsArray.
  class StaticSolidsOutputsArray < OutputsArray
  end

  # See SpritesOutputsArray.
  class StaticSpritesOutputsArray < OutputsArray
  end

  # See LabelsOutputsArray.
  class StaticLabelsOutputsArray < OutputsArray
  end

  # See BordersOutputsArray.
  class StaticBordersOutputsArray < OutputsArray
  end

  # See LinesOutputsArray.
  class StaticLinesOutputsArray < OutputsArray
  end

  # See DebugOutputsArray.
  class StaticDebugOutputsArray < OutputsArray
  end

  # See PrimitivesOutputsArray.
  class StaticPrimitivesOutputsArray < OutputsArray
  end
end
