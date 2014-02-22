module Basic101

  class NumericIdentifier < Identifier

    def input(input_reader)
      value = input_reader.read_numeric
      BasicFloat.new(value).simplest
    end

    def default
      BasicInteger.new(0)
    end

  end

end
