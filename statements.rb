module Basic

  class Statements

    include Enumerable

    attr_reader :statements

    def initialize
      @statements = []
      @line_number_index = {}
    end

    def [](i)
      @statements[i]
    end

    def index_of(line_number)
      index = @line_number_index[line_number]
      unless index
        raise UndefinedLineNumberError, "Undefined line number #{line_number}"
      end
      index
    end

    def <<(statement)
      @statements << statement
      if statement.line_number
        @line_number_index[statement.line_number] = @statements.size - 1
      end
    end

    def end_index
      @statements.size + 1
    end

  end

end
