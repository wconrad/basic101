require_relative 'statement'

module Basic

  class InputStatement < Statement

    def initialize(prompt, reference)
      @prompt = prompt
      @reference = reference
    end

    def execute(program)
      if @prompt
        @prompt.print_string program.output
        program.output.print('? ')
      end
      value = @reference.read(program.input)
      @reference.assign(program, value)
      program.goto_next
    end

    protected

    def state
      super + [@prompt, @reference]
    end

  end

end
