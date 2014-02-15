require_relative 'binary_math_operation'

module Basic

  class NotOperation

    include WrapValue

    def initialize(expression)
      @expression = expression
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      expression = other.expression
    end

    def eval(runtime)
      @expression.eval(runtime).not
    end

    protected

    attr_reader :expression

  end

end
