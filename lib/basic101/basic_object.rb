module Basic101

  class BasicObject

    def self.type_name
      name.split('::').last.gsub(/^Basic/, '').downcase
    end

    def type_name
      self.class.type_name
    end

    def eval(runtime)
      self
    end

    def to_numeric
      raise TypeError, "#{type_name} cannot be converted to numeric"
    end

    def to_integer
      raise TypeError, "#{type_name} cannot be converted to integer"
    end

    def to_float
      raise TypeError, "#{type_name} cannot be converted to float"
    end

    def to_string
      raise TypeError, "#{type_name} cannot be converted to string"
    end

  end

end
