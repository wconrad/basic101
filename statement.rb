module Basic

  class Statement

    attr_writer :index
    attr_writer :line

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def error(exception)
      message = "Error on line #{@line.line_number}: #{exception}"
      raise exception, message, exception.backtrace
    end

    def data_items
      []
    end

    def exec(runtime)
    end

    protected

    def state
      []
    end

  end

end
