module Basic

  class PrintSemicolon

    def ==(other)
      other.is_a?(self.class)
    end

    def eval(runtime)
      self
    end

    def print_string(output)
    end

    def print_new_line(output)
    end

  end

end
