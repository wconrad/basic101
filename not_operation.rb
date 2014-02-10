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

    def eval(program)
      value = @expression.eval(program).to_i
      value = value == 0 ? 1 : 0
      wrap_value(value)
    end

    protected

    attr_reader :expression

  end

end
