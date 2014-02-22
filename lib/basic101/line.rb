module Basic101

  class Line

    include Identity

    attr_reader :line_number
    attr_reader :statements

    def initialize(line_number, statements)
      @line_number = line_number.to_i
      @statements = statements
      link_statements_to_line
    end

    protected

    def state
      [@line_number, @statements]
    end

    private

    def link_statements_to_line
      @statements.each do |statement|
        statement.line = self
      end
    end

  end

end
