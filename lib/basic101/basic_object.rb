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

  end

end
