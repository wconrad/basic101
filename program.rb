module Basic

  class Program

    def initialize
      @statements = Statements.new
    end

    def load(file)
      file.each_line do |line|
        Statement.parse(line).each do |statement|
          @statements << statement
        end
      end
    end

    def goto(line_number)
      @statement_index = @statements.index_of(line_number)
    end

    def goto_next
      @statement_index += 1
    end

    def run
      @statement_index = 0
      while statement = @statements[@statement_index]
        statement.execute(self)
      end
    end

  end

end
