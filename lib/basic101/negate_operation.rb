module Basic101

  class NegateOperation

    include Identity

    def initialize(expression)
      @expression = expression
    end

    def eval(runtime)
      @expression.eval(runtime).negate
    end

    protected

    attr_reader :expression

  end

end
