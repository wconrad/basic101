module Basic

  class Line

    attr_reader :line_number
    attr_reader :statements

    def initialize(line_number, statements)
      @line_number = line_number.to_i
      @statements = statements
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      state == other.state
    end

    protected

    def state
      [@line_number, @statements]
    end

  end

end
