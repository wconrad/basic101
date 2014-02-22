require_relative 'statement'

module Basic101

  class RestoreStatement < Statement

    def initialize(line_number)
      @line_number = line_number
    end

    def execute(runtime)
      runtime.restore(@line_number.to_i)
    end

    protected

    def state
      [@line_number]
    end

  end

end
