require_relative 'statement'

module Basic

  class PrintStatement < Statement

    def execute(program)
      program.goto_next
    end

  end

end
