require_relative 'numeric_operation'

module Basic

  class Multiply < NumericOperation

    protected

    def operate(left, right)
      left * right
    end

  end

end
