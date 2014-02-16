require_relative 'statement'

module Basic

  class EndStatement < Statement

    def execute(runtime)
      runtime.end_program
    end

  end

end
