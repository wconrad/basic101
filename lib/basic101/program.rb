# frozen_string_literal: true

module Basic101

  class Program

    include Enumerable

    include Identity

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
      error_cause = error.parse_failure_cause
      error_source = error_cause.source
      line_number, column_number = error_source.line_and_column(error_cause.pos)
      line = source.lines[line_number - 1]
      raise SyntaxError.new(line, line_number, column_number, error.to_s)
    end

    def initialize(lines = [])
      @statements = []
      @line_number_index = {}
      lines.each do |line|
        @line_number_index[line.line_number] = @statements.size
        @statements += line.statements
      end
      set_statement_indices
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

    def data_items(starting_line_number = nil)
      if starting_line_number
        statements = @statements.select do |statement|
          statement.line_number >= starting_line_number
        end
      else
        statements = @statements
      end
      statements.flat_map(&:data_items)
    end

    protected

    def state
      [@statements]
    end

    private

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
