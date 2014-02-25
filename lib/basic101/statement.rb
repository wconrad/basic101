require_relative 'identity'

module Basic101

  class Statement

    include Identity

    attr_writer :index
    attr_writer :line

    def raise_error_with_line_number(exception)
      message = "Error on line #{@line.line_number}: #{exception}"
      raise exception, message, exception.backtrace
    end

    def data_items
      []
    end

    def line_number
      @line.line_number
    end

    def exec(runtime)
    end

    protected

    def state
      []
    end

  end

end
