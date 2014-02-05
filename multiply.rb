require_relative 'wrap_value'

module Basic

  class Multiply

    include WrapValue

    def operate(left, right, program)
      left_value = left.eval(program).value
      right_value = right.eval(program).value
      result = left_value * right_value
      wrap_value(result)
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
