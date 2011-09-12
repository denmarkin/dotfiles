# vim: ft=ruby

# Editor
Pry.config.editor = "mate"

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
# Pry.plugins["doc"].activate! # have no idea why it doesn't loads

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

# HIRB support
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  # Hirb::View.instance_eval do
  #   def enable_output_method
  #     @output_method = true
  #     Pry.config.print = proc do |output, value|
  #       Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  #     end
  #   end
  #
  #   def disable_output_method
  #     Pry.config.print = Pry::DEFAULT_PRINT
  #     @output_method = nil
  #   end
  # end

  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  end
  Hirb.enable
end

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

# loading rails configuration if it is running as a rails console
# load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env