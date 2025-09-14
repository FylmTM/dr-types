module AttrGTK
  # Provides access to the main args object containing game runtime data
  def args= value; end

  # Returns the main args object containing game runtime data
  def args; end

  # Provides access to keyboard input handling
  def keyboard ; end

  # Provides access to the grid system for positioning elements
  def grid ; end

  # Provides access to the persistent state object
  def state; end

  # Provides access to the temporary state object (cleared each tick)
  def temp_state; end

  # Provides access to input handling (keyboard, mouse, controllers)
  def inputs; end

  # Provides access to rendering outputs (sprites, labels, etc.)
  def outputs; end

  # Provides access to the main GTK runtime object
  def gtk; end

  #
  def passes; end

  # Provides access to pixel array manipulation
  def pixel_arrays; end

  # Provides access to geometry utility functions
  def geometry; end

  # Provides access to layout utility functions
  def layout; end

  # Provides access to easing/animation utility functions
  def easing; end

  # Provides access to audio playback functionality
  def audio; end

  # Provides access to event handling
  def events; end

  # Provides access to console variables (cvars)
  def cvars; end

  # Creates a new entity of the specified type with optional initialization
  def new_entity entity_type, init_hash = nil, &block; end

  # Creates a new entity of the specified type with strict typing
  def new_entity_strict entity_type, init_hash = nil, &block; end

  # Returns the current tick count for the scene
  def tick_count; end

  # Returns the global tick count since game start
  def global_tick_count; end
end

class Module
  def attr_gtk
    include AttrGTK
  end
end

class Object
  def self.attr_gtk
    include AttrGTK
  end

  def attr_gtk
    return if self.is_a? AttrGTK
    self.class.include AttrGTK
  end
end
