# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class DefineFunctionStatement < Statement

    def initialize(identifier, parameters, expression)
      @function = UserDefinedFunction.new(identifier, parameters, expression)
    end

    def execute(runtime)
      runtime.add_function @function
    end

    protected

    def state
      @function
    end

  end

end
