require_relative 'statement'

module Basic

  class InputStatement < Statement

    def initialize(prompt, references)
      @prompt = prompt
      @references = references
    end

    def execute(runtime)
      begin
        print_prompt(runtime)
        read_references(runtime)
      rescue InputError => e
        runtime.output.puts "#{e}, try again"
        retry
      end
    end

    protected

    def state
      [@prompt, @references]
    end

    def print_prompt(runtime)
      if @prompt
        @prompt.print_string runtime.output
        runtime.output.print('? ')
      end
    end

    def read_references(runtime)
      input_reader = InputReader.new(runtime.input)
      @references.each do |reference|
        value = reference.read(input_reader)
        reference.assign(runtime, value)
      end
    end

  end

end
