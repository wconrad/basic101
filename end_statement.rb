require_relative 'statement'

module Basic

  class EndStatement < Statement

    def execute(program)
      program.end_program
    end

  end

end
