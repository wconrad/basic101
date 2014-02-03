require_relative 'statement'

module Basic

  class PrintStatement < Statement

    def initialize(line_number = nil, *args)
      super(line_number)
      @args = args
    end

    def execute(program)
      program.goto_next
    end

    protected

    def state
      [@args]
    end

  end

end
