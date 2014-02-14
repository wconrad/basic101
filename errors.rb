module Basic

  class Error < StandardError ; end

  class ArraySizeError < Error ; end
  class ForNextSequenceError < Error ; end
  class ForWithoutNext < Error ; end
  class IndexError < Error ; end
  class InputError < Error ; end
  class NextWithoutFor < Error ; end
  class NoMoreInputError < Error ; end
  class UndefinedLineNumberError < Error ; end

  class BadInputFormatError < InputError ; end
  class TooFewInputItemsError < InputError ; end

  class SyntaxError < Error

    def initialize(line, line_number, column_number, parse_error)
      @line = line
      @line_number = line_number
      @column_number = column_number
      @parse_error = parse_error
      super(message)
    end

    def to_s
      out = StringIO.new
      out.puts @parse_error
      out.puts @line
      out.puts '%*s' % [(@column_number), '^']
      out.string
    end

    private

    def message
      @parse_error
    end

  end

end
