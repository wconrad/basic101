module Basic

  class StringIdentifier < Identifier

    def read(input)
      line = input.gets
      value = line.chomp
      wrap_value(value)
    end

  end

end
