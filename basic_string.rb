module Basic

  class BasicString

    def initialize(value)
      @value = value
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.value == other.value
    end

    def eval
      self
    end

    def print_string(output)
      output.print @value
    end

    def print_new_line(output)
      output.print "\n"
    end

    protected

    attr_reader :value

  end

end