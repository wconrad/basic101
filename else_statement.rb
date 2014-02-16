require_relative 'statement'

module Basic

  class ElseStatement < Statement

    attr_writer :end_statement

    def initialize
    end

    def execute(runtime)
    end

    def goto(runtime)
      runtime.goto_index(@index)
    end

  end

end
