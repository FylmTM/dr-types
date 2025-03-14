# noinspection RubyUnusedLocalVariable
module GTK
  # A PixelArray object with a width, height and an Array of pixels.
  # Pixels are hexadecimal color values in ABGR format.
  #
  # Create a pixel array:
  #   w = 200
  #   h = 100
  #   args.pixel_array(:my_pixel_array).w = w
  #   args.pixel_array(:my_pixel_array).h = h
  #
  # Fill the pixels with values (transparent if nil):
  #   args.pixel_array(:my_pixel_array).pixels.fill #FF00FF00, 0, w * h
  #
  # Draw by using the symbol as path:
  #   args.outputs.sprites << { x: 500, y: 300, w: 200, h: 100, path: :my_pixel_array }
  #
  # Access specific x, y position (bottom-left coordinate system):
  #   x = 150
  #   y = 33
  #   args.pixel_array(:my_pixel_array).pixels[(height - y) * width + x] = 0xFFFFFFFF
  class PixelArray
    # Width of the pixel array. Alias for w.
    attr_accessor :width
    # Height of the pixel array. Alias for h.
    attr_accessor :height
    # Width of the pixel array.
    attr_accessor :w
    # Height of the pixel array.
    attr_accessor :h
    # Array of pixel values in ABGR format (hexadecimal).
    # To convert RGB hex (like skyblue #87CEEB) to ABGR hex:
    # 1. Split in pairs (87, CE, EB)
    # 2. Reverse order (EB, CE, 87)
    # 3. Add alpha component (FF for full opacity: #FFEBCE87)
    attr_accessor :pixels

    # Fills a section of the pixel array with a color.
    # 
    #   # Fill the entire array with green
    #   pixel_array.fill(color: 0xFF00FF00, offset: 0, length: width * height)
    def fill(color:, offset:, length:) end
  end
end
