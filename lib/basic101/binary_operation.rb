# frozen_string_literal: true

require_relative 'identity'

module Basic101

  class BinaryOperation

    include Identity

    def initialize(operator, right)
      @operator = operator
      @right = right
    end

    def operate(left, runtime)
      if @operator.is_a?(Symbol)
        left_value = left.eval(runtime)
        right_value = @right.eval(runtime)
        left_value.public_send(@operator, right_value)
      else
        @operator.operate(left, @right, runtime)
      end
    end

    protected

    def state
      [@operator, @right]
    end

  end

end
