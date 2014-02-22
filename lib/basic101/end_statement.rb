require_relative 'statement'

module Basic101

  class EndStatement < Statement

    def execute(runtime)
      runtime.end_program
    end

  end

end
