module Basic

  class Program

    def initialize
      @lines = Lines.new
    end

    def load(file)
      file.each_line do |line|
        Statement.parse(line).each do |statement|
          @lines << statement
        end
      end
    end

    def goto(line_number)
      @line_index = @lines.index_of(line_number)
    end

    def goto_next
      @line_index += 1
    end

    def run
      @line_index = 0
      while line = @lines[@line_index]
        line.execute(self)
      end
    end

  end

end
