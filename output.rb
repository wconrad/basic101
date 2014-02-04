module Basic

  class Output

    def initialize(file = $stdout)
      @file = file
      @chars_on_line = 0
    end

    def print(s)
      s.chars.each do |c|
        case c
        when "\n"
          @file.print c
          @chars_on_line = 0
        when "\t"
          write_char ' '
          while @chars_on_line % 15 > 0
            write_char ' '
          end
        else
          write_char c
        end
      end
    end

    private

    def write_char(c)
      @file.print c
      @chars_on_line += 1
    end

  end

end
