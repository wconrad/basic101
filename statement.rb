module Basic

  class Statement

    attr_accessor :line_number

    def initialize(line_number = nil)
      @line_number = line_number
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      [line_number]
    end

  end

end
