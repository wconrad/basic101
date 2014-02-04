module Basic

  class FunctionCall

    def initialize(identifier, arguments)
      @identifier = identifier
      @arguments = arguments
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      [@identifier, @arguments]
    end

  end

end
