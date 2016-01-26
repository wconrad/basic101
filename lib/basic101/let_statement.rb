# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class LetStatement < Statement

    def initialize(reference, expression)
      @reference = reference
      @expression = expression
    end

    def execute(runtime)
      @reference.assign(runtime, @expression.eval(runtime))
    end

    protected

    def state
      [@reference, @expression]
    end

  end

end
