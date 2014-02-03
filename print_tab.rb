module Basic

  class PrintTab

    def ==(other)
      other.is_a?(self.class)
    end

    def eval
      self
    end

    def print_string(output)
      output.print_tab
    end

    def print_new_line(output)
    end

  end

end
