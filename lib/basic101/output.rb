module Basic101

  class Output

    def initialize(file = $stdout)
      @file = file
      @chars_on_line = 0
    end

    def puts(s = '')
      print s.to_s + "\n"
    end

    def print(s)
      s.chars.each do |c|
        case c
        when "\n"
          @file.print c
          @chars_on_line = 0
        when "\t"
          write_char ' '
          while @chars_on_line % COLUMNS_PER_TAB > 0
            write_char ' '
          end
        else
          write_char c
        end
      end
    end

    def tab_to(column)
      column = [0, column].max
      spaces_needed = -> {column - @chars_on_line}
      return if spaces_needed.call < 0
      print ' ' * spaces_needed.call
    end

    def isatty
      @file.isatty
    end

    private

    COLUMNS_PER_TAB = 14

    def write_char(c)
      @file.print c
      @chars_on_line += 1
    end

  end

end
