require_relative 'abs_function'
require_relative 'asc_function'
require_relative 'chr_function'
require_relative 'int_function'
require_relative 'left_function'
require_relative 'len_function'
require_relative 'mid_function'
require_relative 'right_function'
require_relative 'rnd_function'
require_relative 'str_function'
require_relative 'tab_function'
require_relative 'val_function'

module Basic

  class Functions

    def initialize(functions = BuiltInFunctions.make)
      @functions = {}
      functions.each do |function|
        add_function function
      end
    end

    def call(runtime, identifier, argument_values)
      @functions[identifier.to_s].call(runtime, argument_values)
    end

    def add_function(function)
      @functions[function.name] = function
    end

    def has_function?(name)
      @functions.has_key?(name.to_s)
    end

  end

end
