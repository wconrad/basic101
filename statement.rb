module Basic

  class Statement

    include Comparable

    attr_reader :line_number
    attr_reader :source

    def initialize(line_number, source)
      @line_number = line_number
      @source = source
    end

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
