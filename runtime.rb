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
      @program_counter.goto(line_number)
    end

    def end_program
      @program_counter.goto_end
    end

    def run
      srand(0)
      @program_counter = ProgramCounter.new(@program)
      while !@program_counter.end?
        statement = @program_counter.current_statement
        @program_counter.goto_next
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
