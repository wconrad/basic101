module Basic

  class Line

    def initialize(source_line)
      @source_line = source_line
    end

    def statements
      #TODO fix long line
      match_data = /^ *(?<line_number>\d+) +(?<source>.*?) *$/.match(@source_line)
      unless match_data
        raise SyntaxError, "Syntax error: #{@source_line}"
      end
      [
        Statement.new(match_data[:line_number].to_i,
                      match_data[:source]),
      ]
    end

  end

end
