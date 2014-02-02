module Basic

  class Line

    attr_reader :line_number
    attr_reader :source

    def self.parse(line)
      match_data = /^ *(?<line_number>\d+) +(?<source>.*?) *$/.match(line)
      unless match_data
        raise SyntaxError, "Syntax error: #{line}"
      end
      Line.new(match_data[:line_number].to_i, match_data[:source])
    end

    def initialize(line_number, source)
      @line_number = line_number
      @source = source
    end

  end

end
