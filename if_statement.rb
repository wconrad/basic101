require_relative 'statement'

module Basic

  class IfStatement < Statement

    attr_writer :else_statement

    def initialize(condition)
      @condition = condition
    end

    def end_statement=(statement)
      @else_statement.end_statement = statement
    end

    def execute(runtime)
      if @condition.eval(runtime).to_f == 0
        @else_statement.goto_following_statement(runtime)
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
