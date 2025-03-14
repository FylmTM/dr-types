# noinspection RubyUnusedLocalVariable
module GTK
  class Assert
    def ok!
    end

    def true!(value, message = nil) end

    def false!(value, message = nil) end

    def equal!(actual, expected, message = nil) end

    def not_equal!(actual, expected, message = nil) end

    def nil!(value, message = nil) end

    def assertion_error!(message) end
  end
end
