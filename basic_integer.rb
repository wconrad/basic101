require_relative 'basic_numeric'

module Basic

  class BasicInteger < BasicNumeric

    include CoercionHelper

    def self.from_bool(b)
      new(b ? -1 : 0)
    end

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.value == other.value
    end

    def eval(runtime)
      self
    end

    def to_i
      @value.to_i
    end

    def to_f
      @value.to_f
    end

    def to_b
      to_i != 0
    end

    def str
      BasicString.new(@value.to_s)
    end

    def simplest
      self
    end

    def coerce(other)
      case other
      when self.class
        [other, self]
      when BasicFloat
        [other, BasicFloat.new(value)]
      else
        coercion_failed(self, other)
      end
    end

    def to_integer
      self
    end

    def to_float
      BasicFloat.new(@value)
    end

    def to_string
      raise TypeError, 'integer cannot be converted to string'
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
    rescue RangeError
    end

    private

    def format
      @value.to_s
    end

  end

end
