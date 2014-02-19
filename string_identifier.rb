module Basic

  class StringIdentifier < Identifier

    def input(input_parser)
      value = input_parser.read_string
      wrap_value(value)
    end

    def default
      BasicString.new('')
    end

  end

end
