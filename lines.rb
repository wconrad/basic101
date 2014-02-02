module Basic

  class Lines

    include Enumerable

    def initialize
      @lines = []
    end

    def <<(line)
      @lines[line.line_number] = line
    end

    def each(&block)
      @lines.compact.each(&block)
    end

    def from_line(line_number)
      unless @lines[line_number]
        raise UndefinedLineNumberError, "Undefined line number: #{line_number}"
      end
      Enumerator.new do |yielder|
        @lines[line_number..-1].compact.each do |line|
          yielder.yield line
        end
      end
    end

  end

end
