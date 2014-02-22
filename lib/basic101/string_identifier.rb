module Basic101

  class StringIdentifier < Identifier

    def input(input_parser)
      value = input_parser.read_string
      BasicString.new(value)
    end

    def default
      BasicString.new('')
    end

  end

end
