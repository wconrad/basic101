# frozen_string_literal: true

require_relative 'statement'

module Basic101

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

    protected

    def state
      [@condition, @true_statement]
    end

  end

end
