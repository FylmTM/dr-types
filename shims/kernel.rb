# noinspection RubyUnusedLocalVariable
module GTK
  # Kernel in the DragonRuby Runtime has patches for how standard out is handled
  # and also contains a unit of time in games called a tick.
  module Kernel
    # Returns the current tick of the game. This value is reset if you call $gtk.reset.
    #
    #   def tick args
    #     args.outputs.labels << {
    #       x: 640,
    #       y: 360,
    #       text: "current tick count is: #{Kernel.tick_count}"
    #     }
    #   end
    attr_reader :tick_count
    
    # Returns the current tick of the application from the point it was started.
    # This value is never reset.
    #
    #   def boot args
    #     puts "The current tick count is: #{Kernel.tick_count}"
    #     puts "The global tick count is: #{Kernel.global_tick_count}"
    #   end
    attr_reader :global_tick_count
  end
end
