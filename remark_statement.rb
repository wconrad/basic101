require_relative 'statement'

module Basic

  class RemarkStatement < Statement

    def execute(program)
      program.goto_next
    end

  end

end
