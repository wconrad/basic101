require_relative 'statement'

module Basic

  class LetStatement < Statement

    def initialize(reference, expression)
      @reference = reference
      @expression = expression
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def execute(runtime)
      @reference.assign(runtime, @expression.eval(runtime))
    end

    protected

    def state
      super + [@reference, @expression]
    end

  end

end
