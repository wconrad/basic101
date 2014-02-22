module Basic101

  class Identifier

    def initialize(name)
      @name = name.to_s
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      to_s == other.to_s
    end

    def to_s
      @name
    end

  end

end
