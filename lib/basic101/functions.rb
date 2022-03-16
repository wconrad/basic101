# frozen_string_literal: true

module Basic101

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
