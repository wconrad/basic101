require_relative 'statement'

module Basic101

  class EndifStatement < Statement

    def initialize
    end

    def execute(runtime)
    end

    def goto_following_statement(runtime)
      runtime.goto_index(@index + 1)
    end

  end

end
