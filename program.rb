module Basic

  class Program

    attr_reader :output
    attr_reader :functions

    def initialize(output_file = $stdout)
      @statements = Statements.new
      @output = Output.new(output_file)
      @functions = {
        'TAB' => TabFunction.new,
      }
    end

    def load(source_file)
      source_file.each_line do |source_line|
        line = Line.new(source_line)
        line.statements.each do |statement|
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
