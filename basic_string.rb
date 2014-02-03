module Basic

  class BasicString

    def initialize(value)
      @value = value
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.to_s == other.to_s
    end

    def to_s
      @value.to_s
    end

    def eval
      self
    end

  end

end
