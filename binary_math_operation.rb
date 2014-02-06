require_relative 'boolean'
require_relative 'wrap_value'

module Basic

  module BinaryMathOperation

    include WrapValue
    include Boolean

    def operate(left, right, program)
      left_value = left.eval(program).value
      right_value = right.eval(program).value
      result = do_math(left_value, right_value)
      wrap_value(result)
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
