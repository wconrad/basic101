require_relative 'statement'

module Basic

  class PrintStatement < Statement

    def initialize(line_number = nil, args = [])
      super(line_number)
      @args = args
    end

    def execute(program)
      if @args.empty?
        program.output.print "\n"
      else
        @args.each do |arg|
          arg.eval(program).print_string program.output
        end
        @args.last.eval(program).print_new_line program.output
      end
      program.goto_next
    end

    protected

    def state
      super + [@args]
    end

  end

end
