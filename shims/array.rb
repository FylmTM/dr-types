# noinspection RubyUnusedLocalVariable
class Array
  # Given a block, each 2D array index is invoked against the block.
  # Useful for processing 2D array data such as game stage layouts.
  #
  # Example:
  #   stage = [
  #     [:enemy, :empty, :player],
  #     [:empty, :empty, :empty],
  #     [:enemy, :empty, :enemy],
  #   ]
  #
  #   occupied_tiles = stage.map_2d do |row, col, tile|
  #     if tile == :empty
  #       nil
  #     else
  #       [row, col, tile]
  #     end
  #   end.reject_nil
  def map_2d
  end

  # Returns true if any of the elements in the array exist in the collection of items passed in.
  #
  # Example:
  #   l1 = [:a, :b, :c]
  #   result = l1.include_any?(:b, :c, :d)
  #   # => true
  #
  #   l1 = [:a, :b, :c]
  #   l2 = [:b, :c, :d]
  #   result = l1.include_any?(*l2)
  #   # => true
  def include_any?(*elements) end

  # Returns true if any of the elements (which must have left, right, top, bottom properties)
  # intersect with the given rect. Default tolerance is 0.1.
  #
  # Example:
  #   walls = [
  #     [10, 10, 10, 10],
  #     { x: 20, y: 20, w: 10, h: 10 },
  #   ]
  #   
  #   player = Player.new 9, 10, 10, 10
  #   walls.any_intersect_rect?(player)
  #   # => true
  def any_intersect_rect?(rect) end

  # Returns an Enumerable rejecting items that are nil or false.
  #
  # Example:
  #   arr = [1, nil, 4, false, :a].reject_false
  #   # => [1, 4, :a]
  def reject_false
  end

  # Returns an Enumerable rejecting items that are nil.
  # This is an alias for Array#compact
  #
  # Example:
  #   arr = [1, nil, 4, false, :a].reject_nil
  #   # => [1, 4, false, :a]
  alias reject_nil compact
end
