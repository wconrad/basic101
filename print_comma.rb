module Basic

  class PrintComma

    def ==(other)
      other.is_a?(self.class)
    end

    def eval(runtime)
      self
    end

    def print_string(output)
      output.print "\t"
    end

    def print_new_line(output)
    end

  end

end