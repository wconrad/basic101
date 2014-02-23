require_relative 'basic_numeric'

module Basic101

  class BasicFloat < BasicNumeric

    def self.from_s(s)
      value = s.to_f
      new(value)
    end

    def to_integer
      BasicInteger.new(@value.to_i)
    end

    def to_float
      self
    end

    def to_string
      raise TypeError, 'float cannot be converted to string'
    end

    def str
      BasicString.new(@value.to_s)
    end

    def or(other)
      to_integer.or(other)
    end

    def and(other)
      to_integer.and(other)
    end

    def not
      to_integer.not
    end

    def floor
      BasicInteger.new(@value.floor)
    end

    private

    def format
      @value.to_s
    end

  end

end
