require_relative 'binary_math_operation'

module Basic

  class PowerOperation

    include WrapValue

    def initialize(left, right)
      @left = left
      @right = right
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      state == other.state
    end

    def eval(runtime)
      @left.eval(runtime) ** @right.eval(runtime)
    end

    protected

    def state
      [@left, @right]
    end

  end

end
