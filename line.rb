module Basic

  class Line

    def initialize(source_line)
      @source_line = source_line
    end

    def statements
      match_data = @source_line.match(SOURCE_REGEX)
      unless match_data
        raise SyntaxError, "Syntax error: #{@source_line}"
      end
      [
        Statement.new(match_data[:line_number].to_i,
                      match_data[:source]),
      ]
    end

    private

    SOURCE_REGEX = /^ *(?<line_number>\d+) +(?<source>.*?) *$/
    private_constant :SOURCE_REGEX

  end

end
