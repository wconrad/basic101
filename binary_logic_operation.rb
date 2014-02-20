require_relative 'boolean'

module Basic

  module BinaryLogicOperation

    def operate(left, right, runtime)
      left_value = left.eval(runtime).to_b
      right_value = right.eval(runtime).to_b
      result = do_operation(left_value, right_value)
      BasicInteger.from_bool(result)
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
