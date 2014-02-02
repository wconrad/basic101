module Basic

  #TODO rename to Statements
  class Lines

    include Enumerable

    attr_reader :lines

    def initialize
      @lines = []
      @line_number_index = {}
    end

    def [](i)
      @lines[i]
    end

    def index_of(line_number)
      index = @line_number_index[line_number]
      unless index
        raise UndefinedLineNumberError, "Undefined line number #{line_number}"
      end
      index
    end

    def <<(line)
      @lines << line
      if line.line_number
        @line_number_index[line.line_number] = @lines.size - 1
      end
    end

  end

end
