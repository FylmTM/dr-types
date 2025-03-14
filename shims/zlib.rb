# noinspection RubyUnusedLocalVariable
# Provides functions to compress and uncompress strings.
module Zlib
  # Compresses a string and returns the compressed value.
  #
  # Example:
  #   compressed = Zlib.compress("hello world")
  def compress(value) end

  # Uncompresses a compressed string and returns the original value.
  #
  # Example:
  #   original = Zlib.uncompress(compressed_string)
  def uncompress(value) end

  # Alias for compress
  alias deflate compress
  
  # Alias for uncompress
  alias inflate uncompress
end
