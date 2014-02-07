require_relative 'statement'

module Basic

  class PrintStatement < Statement

    def initialize(args = [])
      @args = args
    end

    def execute(program)
      if @args.empty?
        program.output.print "\n"
      else
        arg_values = @args.map do |arg|
          arg.eval(program)
        end
        arg_values.each do |value| 
         value.print_string program.output
        end
        arg_values.last.print_new_line program.output
      end
      program.goto_next
    end

    protected

    def state
      super + [@args]
    end

  end

end
