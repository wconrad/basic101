require_relative 'statement'

module Basic

  class OnGotoStatement < Statement

    attr_writer :next_statement

    def initialize(reference, line_numbers)
      @reference = reference
      @line_numbers = line_numbers
    end

    def execute(runtime)
      index = @reference.eval(runtime).to_i - 1
      if (0...@line_numbers.size).include?(index)
        runtime.goto_line(@line_numbers[index].to_i)
      end
    end

    protected

    def state
      [@reference, @line_numbers]
    end

  end

end
