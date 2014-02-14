require_relative 'statement'

module Basic

  class GotoStatement < Statement

    def initialize(target_line_number)
      @target_line_number = target_line_number
    end

    def execute(program)
      program.goto_line(@target_line_number)
    end

    protected

    def state
      super + [@target_line_number]
    end

  end

end
