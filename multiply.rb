module Basic

  class Multiply

    def initialize(left, right)
      @left = left
      @right = right
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def eval(program)
      left_value = @left.eval(program)
      right_value = @right.eval(program)
      result = left_value.to_f * right_value.to_f
      if result.modulo(1) == 0
        BasicInteger.new(result.to_i)
      else
        BasicFloat.new(result)
      end
    end

    protected

    def state
      [@left, @right]
    end

  end

end
