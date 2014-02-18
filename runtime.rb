module Basic

  class Runtime

    attr_reader :input
    attr_reader :output
    attr_reader :for_stack

    def initialize(args = {})
      @input = Input.new(args.fetch(:input_file, $stdin))
      @output = Output.new(args.fetch(:output_file, $stdout))
      @program = args.fetch(:program, Program.new)
      @functions = Functions.new
      @for_stack = ForStack.new
    end

    def goto_line(line_number)
      @program_counter.goto_line(line_number)
    end

    def gosub_line(line_number)
      @program_counter.gosub_line(line_number)
    end

    def return
      @program_counter.return
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
          @program_counter.goto_next_statement
          statement.execute(self)
        end
      rescue StandardError => e
        statement.error(e)
      end
    end

    def function_exists?(identifier)
      @functions.has_function?(identifier)
    end

    def call_function(identifier, argument_values)
      @functions.call(self, identifier, argument_values)
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

    def restore(line_number = nil)
      @data_items = @program.data_items(line_number)
    end

    private

    def reset
      @scalars = {}
      @arrays = {}
      @program_counter = ProgramCounter.new(@program)
      restore
    end

  end

end
