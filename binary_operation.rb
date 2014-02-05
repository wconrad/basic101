module Basic

  class BinaryOperation

    def initialize(operator, right)
      @operator = operator
      @right = right
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def operate(left, program)
      @operator.operate(left, @right, program)
    end

    protected

    def state
      [@operator, @right]
    end

  end

end
