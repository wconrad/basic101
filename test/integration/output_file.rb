module Integration

  class OutputFile

    extend Forwardable

    attr_accessor :max_lines

    def initialize
      @out = StringIO.new
      @total_lines = 0
      @max_lines = nil
    end

    def print(*s)
      raise_if_too_many_lines(s)
      @out.print(*s)
    end

    def puts(*s)
      raise_if_too_many_lines(s)
      puts_unchecked(*s)
    end

    def_delegator :@out, :isatty
    def_delegator :@out, :flush
    def_delegator :@out, :string
    def_delegator :@out, :puts, :puts_unchecked

    def raise_if_too_many_lines(*s)
      num_lines = s.join.scan(/\n/).size
      @total_lines += num_lines
      if max_lines && @total_lines >= max_lines
        raise MaxOutputLines, "Maximum output lines reached"
      end
    end

  end

end
