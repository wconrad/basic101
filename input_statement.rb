require_relative 'statement'

module Basic

  class InputStatement < Statement

    def initialize(prompt, references)
      @prompt = prompt
      @references = references
    end

    def execute(program)
      begin
        print_prompt(program)
        read_references(program)
      rescue InputError => e
        program.output.puts "#{e}, try again"
        retry
      end
    end

    protected

    def state
      [@prompt, @references]
    end

    def print_prompt(program)
      if @prompt
        @prompt.print_string program.output
        program.output.print('? ')
      end
    end

    def read_references(program)
      input_reader = InputReader.new(program.input)
      @references.each do |reference|
        value = reference.read(input_reader)
        reference.assign(program, value)
      end
    end

  end

end
