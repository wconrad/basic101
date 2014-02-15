module Basic

  class Runtime

    attr_reader :input
    attr_reader :output

    def initialize(args = {})
      @input = Input.new(args.fetch(:input_file, $stdin))
      @output = Output.new(args.fetch(:output_file, $stdout))
      @program = args.fetch(:program, Program.new)
      @functions = {
        'INT' => IntFunction.new,
        'RND' => RndFunction.new,
        'TAB' => TabFunction.new,
      }
    end

    def goto_line(line_number)
      @program_counter.goto_line(line_number)
    end

    def goto_index(index)
      @program_counter.goto_index(index)
    end

    def goto_index_after(index)
      @program_counter.goto_index_after(index)
    end

    def end_program
      @program_counter.goto_end
    end

    def run
      reset
      begin
        while !@program_counter.end?
          statement = @program_counter.current_statement
          @program_counter.goto_next
          statement.execute(self)
        end
      rescue Error => e
        statement.error(e)
      end
    end

    def function_exists?(identifier)
      @functions.has_key?(identifier.to_s)
    end

    def call_function(identifier, argument_values)
      @functions[identifier.to_s].call(self, argument_values)
    end

    def get_scalar(identifier)
      @scalars[identifier.to_s] ||= BasicInteger.new(0)
    end

    def set_scalar(identifier, value)
      @scalars[identifier.to_s] = value
    end

    def get_array(identifier, num_dimensions) 
      @arrays[identifier.to_s] ||=
        BasicArray.new(num_dimensions, identifier.default)
    end

    def get_data_item
      data_item = @data_items.shift
      raise OutOfDataError unless data_item
      data_item
    end

    private

    def reset
      @scalars = {}
      @arrays = {}
      @program_counter = ProgramCounter.new(@program)
      @data_items = @program.data_items
    end

  end

end
