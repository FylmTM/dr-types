# noinspection RubyUnusedLocalVariable
module GTK
  # A set of functions that allow you to determine the current progression of an easing function.
  # All functions are available globally via `Easing.*`.
  module Easing
    # Given a start, current, duration, and multiple bezier values, returns a number 
    # between 0 and 1 representing the progress of an easing function.
    #
    # Example:
    #   start_time = 10
    #   duration = 300
    #   spline_definition = [
    #     [0.0, 0.25, 0.75, 1.0],
    #     [1.0, 0.75, 0.25, 0.0]
    #   ]
    #
    #   current_progress = Easing.spline start_time,
    #                                   Kernel.tick_count,
    #                                   duration,
    #                                   spline_definition
    #
    #   # Use current_progress to interpolate position
    #   args.outputs.solids << {
    #     x: 1280 * current_progress,
    #     y: 360,
    #     w: 10,
    #     h: 10
    #   }
    def self.spline(start_tick, current_tick, duration, spline) end

    # Smooth start easing function (slow at first, then accelerates).
    # Has multiple invocation variants:
    #
    # Variant 1:
    #   Easing.smooth_start(initial: 0.0, final: 1.0, perc: value, power: 1.0)
    #
    # Variant 2:
    #   Easing.smooth_start(start_at: tick, end_at: end_tick, tick_count: current_tick, power: 1.0)
    #
    # Variant 3:
    #   Easing.smooth_start(start_at: tick, duration: duration_ticks, tick_count: current_tick, power: 1.0)
    #
    # Example:
    #   y_perc = Easing.smooth_start(start_at: 0,
    #                               end_at: 60,
    #                               tick_count: args.state.clock,
    #                               power: 5)
    def self.smooth_start(initial = nil, final = nil, perc = nil, power = nil, start_at = nil, end_at = nil, tick_count = nil, duration = nil) end

    # Smooth stop easing function (fast at first, then decelerates).
    # Has multiple invocation variants:
    #
    # Variant 1:
    #   Easing.smooth_stop(initial: 0.0, final: 1.0, perc: value, power: 1.0)
    #
    # Variant 2:
    #   Easing.smooth_stop(start_at: tick, end_at: end_tick, tick_count: current_tick, power: 1.0)
    #
    # Variant 3:
    #   Easing.smooth_stop(start_at: tick, duration: duration_ticks, tick_count: current_tick, power: 1.0)
    #
    # Example:
    #   y_perc = Easing.smooth_stop(start_at: 0,
    #                               end_at: 60,
    #                               tick_count: args.state.clock,
    #                               power: 5)
    def self.smooth_stop(initial = nil, final = nil, perc = nil, power = nil, start_at = nil, end_at = nil, tick_count = nil, duration = nil) end

    # Smooth step easing function (combination of smooth start and smooth stop).
    # Has multiple invocation variants:
    #
    # Variant 1:
    #   Easing.smooth_step(initial: 0.0, final: 1.0, perc: value, power: 1.0)
    #
    # Variant 2:
    #   Easing.smooth_step(start_at: tick, end_at: end_tick, tick_count: current_tick, power: 1.0)
    #
    # Variant 3:
    #   Easing.smooth_step(start_at: tick, duration: duration_ticks, tick_count: current_tick, power: 1.0)
    #
    # Example:
    #   y_perc = Easing.smooth_step(start_at: 0,
    #                               end_at: 60,
    #                               tick_count: args.state.clock,
    #                               power: 5)
    def self.smooth_step(initial = nil, final = nil, perc = nil, power = nil, start_at = nil, end_at = nil, tick_count = nil, duration = nil) end

    # Mixes two values based on a percentage.
    # The first two parameters are the values to mix, and the third parameter is the mix percentage.
    #
    # Example:
    #   y_perc_a = Easing.smooth_start(start_at: 0, end_at: 60, tick_count: args.state.clock, power: 5)
    #   y_perc_b = Easing.smooth_stop(start_at: 0, end_at: 60, tick_count: args.state.clock, power: 5)
    #
    #   # a 50/50 mix of smooth_start and smooth_stop gives us a smooth_step
    #   y_perc = Easing.mix(y_perc_a, y_perc_b, 0.5)
    def self.mix(a, b, perc) end

    # Chain multiple easing functions together.
    # Returns a float value between 0 and 1 representing the percentage.
    #
    # Available built-in definitions:
    # - :identity - Linear progression f(x) = x
    # - :flip - Reverse progression f(x) = 1 - x
    # - :quad, :cube, :quart, :quint - Power easing functions
    # - :smooth_start_quad, :smooth_start_cube, etc. - Aliases for power functions
    # - :smooth_stop_quad, :smooth_stop_cube, etc. - Aliases for combined functions
    #
    # Example:
    #   percentage = Easing.ease 60,              # start_tick
    #                            Kernel.tick_count, # current_tick
    #                            120,             # duration
    #                            :identity        # easing definition
    #
    # Example with combined definitions:
    #   # :flip, :quad, :flip is Smooth Stop
    #   percentage = Easing.ease start_tick,
    #                           current_tick,
    #                           duration,
    #                           :flip, :quad, :flip
    def self.ease(start_tick, current_tick, duration, *definitions) end
  end
end
