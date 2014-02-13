require_relative 'boolean'
require_relative 'wrap_value'

module Basic

  module BinaryLogicOperation

    include WrapValue

    def operate(left, right, program)
      left_value = left.eval(program).to_b
      right_value = right.eval(program).to_b
      result = do_operation(left_value, right_value)
      wrap_value(result)
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
