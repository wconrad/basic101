require_relative 'statement'

module Basic101

  class OnGotoStatement < Statement

    attr_writer :next_statement

    def initialize(expression, line_numbers)
      @expression = expression
      @line_numbers = line_numbers
    end

    def execute(runtime)
      index = @expression.eval(runtime).to_i - 1
      if (0...@line_numbers.size).include?(index)
        runtime.goto_line(@line_numbers[index].to_i)
      end
    end

    protected

    def state
      [@expression, @line_numbers]
    end

  end

end
