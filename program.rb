module Basic

  class Program

    attr_reader :output

    def initialize(output_file = $stdout)
      @statements = Statements.new
      @output = Output.new(output_file)
      @functions = {
        'INT' => IntFunction.new,
        'RND' => RndFunction.new,
        'TAB' => TabFunction.new,
      }
      @variables = {}
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
      srand(0)
      @statement_index = 0
      while statement = @statements[@statement_index]
        statement.execute(self)
      end
    end

    def function_exists?(identifier)
      @functions.has_key?(identifier.to_s)
    end

    def call_function(identifier, argument_values)
      @functions[identifier.to_s].call(self, argument_values)
    end

    def get_variable(identifier)
      value = @variables[identifier.to_s]
      value || BasicInteger.new(0)
    end

    def set_variable(identifier, value)
      @variables[identifier.to_s] = value
    end

  end

end
