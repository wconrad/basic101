require_relative 'statement'

module Basic

  class GosubStatement < Statement

    def initialize(target_line_number)
      @target_line_number = target_line_number
    end

    def execute(runtime)
      runtime.gosub_line(@target_line_number)
    end

    protected

    def state
      [@target_line_number]
    end

  end

end
