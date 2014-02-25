module Basic101

  class Output

    def initialize(file = $stdout)
      @file = file
      @chars_on_line = 0
      @transcript = NullTranscript.new
    end

    def transcript=(transcript)
      @transcript = transcript
    end

    def puts(s = '')
      print s.to_s + "\n"
    end

    def print(s)
      write_string s, true
    end

    def echo(s)
      write_string s, false
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

    def write_string(s, transcribe)
      s.chars.each do |c|
        case c
        when "\n"
          write_char c, transcribe
          @chars_on_line = 0
        when "\t"
          write_char ' ', transcribe
          while @chars_on_line % COLUMNS_PER_TAB > 0
            write_char ' ', transcribe
          end
        else
          write_char c, transcribe
        end
      end
      flush
    end

    def write_char(c, transcribe)
      @transcript.save_output(c) if transcribe
      @file.print c
      @chars_on_line += 1 if c =~ /[[:print:]]/
    end

    def flush
      return if isatty
      @file.flush
    end

  end

end
