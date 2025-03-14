# noinspection RubyUnusedLocalVariable
module GTK
  # Store your game state inside of this module.
  # Properties with arbitrary nesting are allowed and a backing Entity will be created for you.
  #
  #   def tick args
  #     args.state.player.x ||= 0
  #     args.state.player.y ||= 0
  #   end
  module State
    include StateEntities
  end

  # Temporary state that gets reset each tick.
  # Useful for storing data that only needs to exist for one frame.
  module TempState
    include StateEntities
  end

  module StateEntities
    # Returns the current tick of the game.
    attr_reader :tick_count

    # Creates a new Entity with a type and initial properties.
    # An optional block can be passed to change the newly created entity.
    #
    #   def tick args
    #     args.state.player ||= args.state.new_entity :player, x: 0, y: 0 do |e|
    #       e.max_hp = 100
    #       e.hp     = e.max_hp * rand
    #     end
    #   end
    def new_entity(entity_type, **init_hash) end

    # Creates a new Strict Entity. 
    # Unlike entities created with new_entity, Strict Entities must define all properties 
    # during initialization. Adding new properties after initialization will result in an exception.
    def new_entity_strict(entity_type, **init_hash) end
  end

  # Entities represent game objects and are automatically created when you use nested properties.
  class Entity
    include Geometry

    # Unique numeric identifier for the entity.
    attr_reader :entity_id
    
    # The type of entity represented as a Symbol.
    attr_accessor :entity_type
    
    # Kernel.tick_count when the entity was created.
    attr_reader :created_at
    
    # Returns the elapsed number of ticks since creation.
    attr_reader :created_at_elapsed
    
    # Kernel.global_tick_count when the entity was created.
    attr_reader :global_created_at
    
    # Returns the elapsed number of global ticks since creation.
    attr_reader :global_created_at_elapsed

    # Access entity properties by key.
    def [](key) end

    # Set entity properties by key.
    def []=(key, value) end

    # Returns the entity as a Hash so you can update values as if you were updating a Hash.
    def as_hash
    end
  end
end
