module Basic101

  class Line

    attr_reader :line_number
    attr_reader :statements

    def initialize(line_number, statements)
      @line_number = line_number.to_i
      @statements = statements
      link_statements_to_line
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      state == other.state
    end

    protected

    def state
      [@line_number, @statements]
    end

    def link_statements_to_line
      @statements.each do |statement|
        statement.line = self
      end
    end

  end

end
