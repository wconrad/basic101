module Basic101

  class NotOperation

    include Identity

    def initialize(expression)
      @expression = expression
    end

    def eval(runtime)
      @expression.eval(runtime).not
    end

    protected

    def state
      [@expression]
    end

  end

end
