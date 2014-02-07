module Basic

  class NumericIdentifier < Identifier

    def read(input)
      line = input.gets
      value = line.to_f
      wrap_value(value).simplest
    end

  end

end
