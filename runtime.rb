module Basic

  class Runtime

    attr_reader :input
    attr_reader :output

    def initialize(args = {})
      @input = args.fetch(:input_file, $stdin)
      @output = Output.new(args.fetch(:output_file, $stdout))
      @program = args.fetch(:program, Program.new)
      @functions = {
        'INT' => IntFunction.new,
        'RND' => RndFunction.new,
        'TAB' => TabFunction.new,
      }
      @variables = {}
    end

    def goto(line_number)
      @statement_index = @program.index_of(line_number)
    end

    def goto_next
      @statement_index += 1
    end

    def end_program
      @statement_index = @program.end_index
    end

    def run
      srand(0)
      @statement_index = 0
      while statement = @program[@statement_index]
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
