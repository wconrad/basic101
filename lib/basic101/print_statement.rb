# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class PrintStatement < Statement

    def initialize(args = [])
      @args = args
    end

    def execute(runtime)
      if @args.empty?
        runtime.output.print "\n"
      else
        arg_values = @args.map do |arg|
          arg.eval(runtime)
        end
        arg_values.each do |value| 
         value.print_string runtime.output
        end
        arg_values.last.print_new_line runtime.output
      end
    end

    protected

    def state
      super + [@args]
    end

  end

end
