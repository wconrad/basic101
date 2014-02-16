module Basic

  class Program

    include Enumerable

    attr_reader :statements

    def self.load_file(source_path)
      File.open(source_path, 'r') do |file|
        load(file)
      end
    end

    def self.load(source_file)
      source = source_file.read
      parser = Parser.new
      transform = Transform.new
      tree = parser.parse(source)
      transform.apply(tree)
    rescue Parslet::ParseFailed => error
      line_number, column_number =
        error.cause.source.line_and_column(error.cause.pos)
      line = source.lines[line_number - 1]
      raise SyntaxError.new(line, line_number, column_number, error.message)
    end

    def initialize(lines = [])
      @statements = []
      @line_number_index = {}
      lines.each do |line|
        @line_number_index[line.line_number] = @statements.size
        @statements += line.statements
      end
      set_statement_indices
      link_for_and_next_statements
      link_if_statements
    end

    def statement_count
      @statements.size
    end

    def [](i)
      @statements[i]
    end

    def index_of_line(line_number)
      index = @line_number_index[line_number]
      unless index
        raise UndefinedLineNumberError, "Undefined line number #{line_number}"
      end
      index
    end

    def data_items
      @statements.flat_map(&:data_items)
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      statements == other.statements
    end

    private

    def link_for_and_next_statements
      stack = []
      @statements.each do |statement|
        if statement.is_a?(ForStatement)
          stack.push statement
        elsif statement.is_a?(NextStatement)
          raise NextWithoutFor if stack.empty?
          for_statement = stack.pop
          for_statement.next_statement = statement
          statement.for_statement = for_statement
        end
      end
      raise ForWithoutNext unless stack.empty?
    end

    def link_if_statements
      stack = []
      @statements.each do |statement|
        case statement
        when IfStatement
          stack.push statement
        when ElseStatement
          if_statement = stack.last
          if_statement.else_statement = statement
        when EndifStatement
          if_statement = stack.pop
          if_statement.end_statement = statement
        end
      end
    end

    def set_statement_indices
      @statements.each.with_index do |statement, i|
        statement.index = i
      end
    end

  end

end
