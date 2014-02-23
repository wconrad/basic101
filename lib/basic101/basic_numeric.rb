require_relative 'basic_math'
require_relative 'basic_object'

module Basic101

  class BasicNumeric < BasicObject

    include Comparable

    include BasicComparisons
    include BasicMath

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def <=>(other)
      return nil unless other.is_a?(BasicNumeric)
      value <=> other.value
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

    def negate
      self.class.new(-value)
    end

    def print_string(output)
      s = format + ' '
      s = ' ' + s unless s =~ /^-/
      output.print s
    end

    def print_new_line(output)
      output.print "\n"
    end

    def abs
      self.class.new(@value.abs)
    end

    def sqr
      BasicFloat.new(@value ** 0.5).simplest
    end

    def exp
      BasicFloat.new(Math::E ** @value).simplest
    end

    def sgn 
      BasicInteger.new(@value <=> 0)
    end

    def log
      BasicFloat.new(Math.log(@value))
    end

    def sin
      BasicFloat.new(Math.sin(@value))
    end

    def cos
      BasicFloat.new(Math.cos(@value))
    end

    def tan
      BasicFloat.new(Math.tan(@value))
    end

  end

end
