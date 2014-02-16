require_relative 'statement'

module Basic

  class IfStatement < Statement

    def initialize(condition, true_statement)
      @condition = condition
      @true_statement = true_statement
    end

    def execute(runtime)
      if @condition.eval(runtime).to_f != 0
        @true_statement.execute(runtime)
      end
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      [@condition, @true_statement]
    end

  end

end
