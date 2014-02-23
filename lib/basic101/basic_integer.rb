require_relative 'basic_numeric'

module Basic101

  class BasicInteger < BasicNumeric

    def self.from_bool(b)
      new(b ? -1 : 0)
    end

    def to_integer
      self
    end

    def to_float
      BasicFloat.new(@value)
    end

    def and(other)
      self.class.new(value & other.to_integer.value)
    end

    def or(other)
      self.class.new(value | other.to_integer.value)
    end

    def not
      self.class.new(~value)
    end

    def chr
      raise InvalidArgumentError unless (0..255).include?(@value)
      BasicString.new(@value.chr)
    end

    def str
      BasicString.new(@value.to_s)
    end

    private

    def format
      @value.to_s
    end

  end

end
