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
    end

    def initialize(lines = [])
      @statements = []
      @line_number_index = {}
      lines.each do |line|
        @line_number_index[line.line_number] = @statements.size
        @statements += line.statements
      end
    end

    def [](i)
      @statements[i]
    end

    def index_of(line_number)
      index = @line_number_index[line_number]
      unless index
        raise UndefinedLineNumberError, "Undefined line number #{line_number}"
      end
      index
    end

    def end_index
      @statements.size + 1
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      statements == other.statements
    end

    private

  end

end
