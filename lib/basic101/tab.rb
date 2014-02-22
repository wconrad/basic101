module Basic101

  class Tab

    def initialize(column)
      @column = column
    end

    def print_string(output)
      output.tab_to(@column)
    end

    def print_new_line(output)
    end

  end

end
