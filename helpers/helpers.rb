module GTK
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
  def self.solid(
    x:, y:,
    w:, h:,
    r: nil, g: nil, b: nil, a: nil,
    anchor_x: nil, anchor_y: nil,
    blendmode_enum: nil)
    {
      x: x, y: y,
      w: w, h: h,
      r: r, g: g, b: b, a: a,
      anchor_x: anchor_x, anchor_y: anchor_y,
      blendmode_enum: blendmode_enum
    }
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
  #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
  #   scale_quality_enum: Scaling quality (0: nearest, 1: linear, 2: anti-alias)
  #
  # Triangle rendering:
  #   Instead of w, h, provide x2, y2, x3, y3 coordinates for triangle vertices
  #   For cropping triangles, use source_x2, source_y2, source_x3, source_y3
  #
  # Array format:
  #   [x, y, width, height, path]
  def self.sprite(
    x:, y:,
    path:,
    w: nil, h: nil,
    r: nil, g: nil, b: nil, a: nil,
    flip_horizontally: nil, flip_vertically: nil,
    angle: nil,
    anchor_x: nil, anchor_y: nil,
    angle_anchor_x: nil, angle_anchor_y: nil,
    tile_x: nil, tile_y: nil, tile_w: nil, tile_h: nil,
    source_x: nil, source_y: nil, source_w: nil, source_h: nil,
    blendmode_enum: nil,
    scale_quality_enum: nil)
    {
      x: x, y: y,
      path: path,
      w: w, h: h,
      r: r, g: g, b: b, a: a,
      flip_horizontally: flip_horizontally, flip_vertically: flip_vertically,
      angle: angle,
      anchor_x: anchor_x, anchor_y: anchor_y,
      angle_anchor_x: angle_anchor_x, angle_anchor_y: angle_anchor_y,
      tile_x: tile_x, tile_y: tile_y, tile_w: tile_w, tile_h: tile_h,
      source_x: source_x, source_y: source_y, source_w: source_w, source_h: source_h,
      blendmode_enum: blendmode_enum,
      scale_quality_enum: scale_quality_enum,
    }
  end

  def self.sprite_triangle(
    x:, y:,
    x2:, y2:,
    x3:, y3:,
    path:,
    r: nil, g: nil, b: nil, a: nil,
    flip_horizontally: nil, flip_vertically: nil,
    angle: nil,
    anchor_x: nil, anchor_y: nil,
    angle_anchor_x: nil, angle_anchor_y: nil,
    source_x: nil, source_y: nil,
    source_x2: nil, source_y2: nil,
    source_x3: nil, source_y3: nil,
    blendmode_enum: nil,
    scale_quality_enum: nil
  )
    {
      x: x, y: y,
      x2: x2, y2: y2,
      x3: x3, y3: y3,
      path: path,
      r: r, g: g, b: b, a: a,
      flip_horizontally: flip_horizontally, flip_vertically: flip_vertically,
      angle: angle,
      anchor_x: anchor_x, anchor_y: anchor_y,
      angle_anchor_x: angle_anchor_x, angle_anchor_y: angle_anchor_y,
      source_x: source_x, source_y: source_y,
      source_x2: source_x2, source_y2: source_y2,
      source_x3: source_x3, source_y3: source_y3,
      blendmode_enum: blendmode_enum,
      scale_quality_enum: scale_quality_enum,
    }
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
  #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
  #
  # Array format:
  #   [x, y, text, size_enum, alignment_enum, r, g, b, a, font]
  def self.label(
    x:, y:,
    text:,
    size_enum: nil, size_px: nil,
    alignment_enum: nil, vertical_alignment_enum: nil,
    r: nil, g: nil, b: nil, a: nil,
    font: nil,
    anchor_x: nil, anchor_y: nil)
    {
      x: x, y: y,
      text: text,
      size_enum: size_enum, size_px: size_px,
      alignment_enum: alignment_enum, vertical_alignment_enum: vertical_alignment_enum,
      r: r, g: g, b: b, a: a,
      font: font,
      anchor_x: anchor_x, anchor_y: anchor_y
    }
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
  def self.border(
    x:, y:,
    w:, h:,
    r: nil, g: nil, b: nil, a: nil,
    anchor_x: nil, anchor_y: nil,
    blendmode_enum: nil)
    {
      x: x, y: y,
      w: w, h: h,
      r: r, g: g, b: b, a: a,
      anchor_x: anchor_x, anchor_y: anchor_y,
      blendmode_enum: blendmode_enum
    }
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
  #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
  #
  # Array format:
  #   [x, y, x2, y2]
  #   [x, y, x2, y2, red, green, blue, alpha]
  def self.line(
    x:, y:,
    x2:, y2:,
    r: nil, g: nil, b: nil, a: nil,
    blendmode_enum: nil)
    {
      x: x, y: y,
      x2: x2, y2: y2,
      r: r, g: g, b: b, a: a,
      blendmode_enum: blendmode_enum
    }
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
  #   blendmode_enum: Blending mode, default 1 (0: none, 1: alpha, 2: additive, 3: modulo, 4: multiply)
  #
  # Array format:
  #   [x, y, width, height]
  #   [x, y, width, height, red, green, blue, alpha]
  def self.solid_primitive(
    x:, y:,
    w:, h:,
    r: nil, g: nil, b: nil, a: nil,
    anchor_x: nil, anchor_y: nil, blendmode_enum: nil)
    {
      x: x, y: y,
      w: w, h: h,
      r: r, g: g, b: b, a: a,
      anchor_x: anchor_x, anchor_y: anchor_y,
      blendmode_enum: blendmode_enum,
      primitive_marker: :solid
    }
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
  def self.border_primitive(
    x:, y:,
    w:, h:,
    r: nil, g: nil, b: nil, a: nil,
    anchor_x: nil, anchor_y: nil, blendmode_enum: nil)
    {
      x: x, y: y, w: w, h: h,
      r: r, g: g, b: b, a: a,
      anchor_x: anchor_x, anchor_y: anchor_y,
      blendmode_enum: blendmode_enum,
      primitive_marker: :border
    }
  end

  # Hash that contains audio sources that are playing.
  #
  # Sounds that don't specify `looping: true` will be removed automatically from the hash after playback ends.
  # Looping sounds or sounds that should stop early must be removed manually.
  #
  # Example of playing a one-time sound:
  #   args.audio[:coin] = { input: "sounds/coin.wav" }
  #   # OR
  #   args.outputs.sounds << "sounds/coin.wav"
  #
  # Example of playing a looping sound:
  #   args.audio[:bg_music] = { input: "sounds/bg-music.ogg", looping: true }
  #
  # Example of stopping a sound:
  #   args.audio[:bg_music] = nil
  #   # OR
  #   args.audio.delete :bg_music
  #
  # Additional audio properties:
  #   args.audio[:my_audio] = {
  #     input: 'sound/boom.wav',  # file path relative to mygame directory
  #     gain:    1.0,             # Volume (float value 0.0 to 1.0)
  #     pitch:   1.0,             # Pitch of the sound (1.0 = original pitch)
  #     paused:  false,           # Set to true to pause the sound at the current playback position
  #     looping: true,            # Set to true to loop the sound/music until you stop it
  #     x: 0.0, y: 0.0, z: 0.0    # Relative position to the listener, x, y, z from -1.0 to 1.0
  #   }
  def self.sound(
    input:,
    gain: nil,
    pitch: nil,
    paused: nil,
    looping: nil,
    x: nil, y: nil, z: nil)
    {
      input: input,
      gain: gain,
      pitch: pitch,
      paused: paused,
      looping: looping,
      x: x, y: y, z: z,
    }
  end
end
