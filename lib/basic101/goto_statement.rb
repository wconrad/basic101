# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class GotoStatement < Statement

    def initialize(target_line_number)
      @target_line_number = target_line_number
    end

    def execute(runtime)
      runtime.goto_line(@target_line_number)
    end

    protected

    def state
      [@target_line_number]
    end

  end

end
