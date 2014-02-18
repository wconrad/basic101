require_relative 'comparison_methods'

module Basic

  class BasicString

    include ComparisonMethods

    attr_reader :value

    def initialize(value)
      @value = value.to_s
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.value == other.value
    end

    def eval(runtime)
      self
    end

    def str
      self
    end

    def print_string(output)
      output.print @value
    end

    def print_new_line(output)
      output.print "\n"
    end

    def simplest
      self
    end

    def compare(other)
      raise TypeError unless other.is_a?(self.class)
      value <=> other.value
    end

    def to_integer
      raise TypeError, "string cannot be converted to integer"
    end

    def to_float
      raise TypeError, "string cannot be converted to float"
    end

    def to_string
      self
    end

    def to_s
      @value
    end

    def left(count)
      count = count.to_i
      if count < 0
        raise InvalidArgumentError
      end
      BasicString.new(@value[0...count])
    end

    def right(count)
      count = count.to_i
      if count < 0
        raise InvalidArgumentError
      end
      substring = @value[/.{0,#{count}}$/]
      BasicString.new(substring)
    end

    def length
      BasicInteger.new(@value.size)
    end

    def mid(start, count = nil)
      start = start.to_i
      count = count && count.to_i
      raise InvalidArgumentError if start < 1
      raise InvalidArgumentError if count && count < 1
      start -= 1
      substring = if count
                    @value[start, count]
                  else
                    @value[start..-1]
                  end
      self.class.new(substring)
    end

    def +(other)
      BasicString.new(value + other.value)
    end

    def asc
      raise InvalidArgumentError if @value.empty?
      BasicInteger.new(@value.chars.first.ord)
    end

    def val
      BasicFloat.new(@value.to_f).simplest
    end

  end

end
