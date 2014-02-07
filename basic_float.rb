module Basic

  class BasicFloat

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.value == other.value
    end

    def eval(program)
      self
    end

    def to_i
      @value.to_i
    end

    def to_f
      @value.to_f
    end

    def print_string(output)
      output.print @value.to_s
    end

    def print_new_line(output)
      output.print "\n"
    end

    def simplest
      if @value.modulo(1) == 0
        BasicInteger.new(@value.to_i)
      else
        self
      end
    end

  end

end
