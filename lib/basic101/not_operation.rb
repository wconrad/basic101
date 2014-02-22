module Basic101

  class NotOperation

    def initialize(expression)
      @expression = expression
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      expression = other.expression
    end

    def eval(runtime)
      @expression.eval(runtime).not
    end

    protected

    attr_reader :expression

  end

end
