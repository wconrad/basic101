module Basic

  class Reference

    def initialize(identifier)
      @identifier = identifier
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def input(input_reader)
      @identifier.input(input_reader)
    end

    protected

    def state
      [@identifier]
    end

  end

end
