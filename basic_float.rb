require_relative 'basic_numeric'

module Basic

  class BasicFloat < BasicNumeric

    include CoercionHelper

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.math_op(method)
      define_method(method) do |other|
        self.class.new(to_f.public_send(method, other.value)).simplest
      end
    end

    math_op :+
    math_op :-
    math_op :*
    math_op :/
    math_op :**

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

    def simplest
      if @value.modulo(1) == 0
        to_integer
      else
        self
      end
    end

    def coerce(other)
      case other
      when self.class
        [other, self]
      when BasicInteger
        [self.class.new(other.value), self]
      else
        coercion_failed(self, other)
      end
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
      BasicFloat.new(@value.floor)
    end

    private

    def format
      @value.to_s
    end

  end

end
