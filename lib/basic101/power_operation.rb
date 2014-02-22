module Basic101

  class PowerOperation

    include Identity

    def initialize(left, right)
      @left = left
      @right = right
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
