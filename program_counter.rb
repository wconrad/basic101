module Basic

  class ProgramCounter

    attr_reader :index

    def initialize(program)
      @program = program
      @index = 0
    end

    def goto_next
      @index += 1
    end

    def end?
      @index >= @program.statement_count
    end

    def goto(line_number)
      @index = @program.index_of(line_number)
    end

    def goto_end
      @index = @program.statement_count + 1
    end

    def current_statement
      @program[@index]
    end

  end

end
