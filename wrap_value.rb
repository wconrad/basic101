module Basic

  module WrapValue

    def wrap_value(o)
      if o.is_a?(String)
        BasicString.new(o)
      elsif o.is_a?(Integer)
        BasicInteger.new(o)
      else
        BasicFloat.new(o)
      end
    end

  end

end
