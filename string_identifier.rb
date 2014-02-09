module Basic

  class StringIdentifier < Identifier

    def read(input_parser)
      value = input_parser.read_string
      wrap_value(value)
    end

  end

end
