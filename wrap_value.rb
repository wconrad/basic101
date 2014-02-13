module Basic

  module WrapValue

    def wrap_value(o)
      if o == true
        BasicInteger.new(1)
      elsif o == false
        BasicInteger.new(0)
      elsif o.is_a?(String)
        BasicString.new(o)
      elsif o.is_a?(Integer)
        BasicInteger.new(o)
      else
        BasicFloat.new(o)
      end
    end

  end

end
