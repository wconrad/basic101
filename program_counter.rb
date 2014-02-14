module Basic

  class ProgramCounter

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

    def goto_index(index)
      @index = index
    end

    def goto_index_after(index)
      goto_index(index + 1)
    end

    def goto_line(line_number)
      goto_index @program.index_of_line(line_number)
    end

    def goto_end
      @index = @program.statement_count + 1
    end

    def current_statement
      @program[@index]
    end

  end

end
