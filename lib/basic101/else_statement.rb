require_relative 'statement'

module Basic101

  class ElseStatement < Statement

    attr_writer :end_statement

    def initialize
    end

    def execute(runtime)
      @end_statement.goto_following_statement(runtime)
    end

    def goto_following_statement(runtime)
      runtime.goto_index(@index + 1)
    end

  end

end
