module Basic

  #TODO rename to Statement
  class Line

    include Comparable

    attr_reader :line_number
    attr_reader :source

    #TODO move into Line
    def self.parse(line)
      match_data = /^ *(?<line_number>\d+) +(?<source>.*?) *$/.match(line)
      unless match_data
        raise SyntaxError, "Syntax error: #{line}"
      end
      [
        Line.new(match_data[:line_number].to_i,
                 match_data[:source]),
      ]
    end

    def initialize(line_number, source)
      @line_number = line_number
      @source = source
    end

    #TODO testme
    def <=>(other)
      self.state <=> other.state
    end

    def execute(program)
      program.goto_next
    end

    protected

    def state
      [@line_number, @source]
    end

  end

end
