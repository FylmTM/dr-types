# noinspection RubyUnusedLocalVariable
module GTK
  class Log
    def self.write_to_log_and_puts(*args) end

    def self.write_to_log_and_print(*args) end

    def self.puts_important(*args, message_code: nil) end

    def self.puts(*args) end

    def self.multiline?(*args) end

    def self.join_lines(args) end

    def self.headline(name, &block) end

    def self.dynamic_block(&block) end

    def self.puts_error(*args) end

    def self.puts_info(*args) end

    def self.reset
    end

    def self.puts_once(*ids, message) end

    def self.puts_once_important(*ids, message) end

    def self.puts_once_info(*ids, message) end

    def self.print(*args) end
  end
end

# noinspection RubyUnusedLocalVariable
class Object
  def log_print(*args) end

  def log_important(*args) end

  def log(*args) end

  def log_spam(str, subsystem = nil) end

  def log_debug(str, subsystem = nil) end

  def log_info(*args) end

  def log_warn(str, subsystem = nil) end

  def log_error(*args) end

  def log_unfiltered(str, subsystem = nil) end

  def log_with_color(xterm_escape_code, *args) end

  def log_reset_color
  end

  def log_black(*args) end

  def log_red(*args) end

  def log_green(*args) end

  def log_yellow(*args) end

  def log_blue(*args) end

  def log_magenta(*args) end

  def log_cyan(*args) end

  def log_white(*args) end

  def log_bright_black(*args) end

  def log_bright_red(*args) end

  def log_bright_green(*args) end

  def log_bright_yellow(*args) end

  def log_bright_blue(*args) end

  def log_bright_magenta(*args) end

  def log_bright_cyan(*args) end

  def log_bright_white(*args) end

  def log_once(*ids, message) end

  def log_once_important(*ids, message) end

  def log_once_info(*ids, message) end
end
