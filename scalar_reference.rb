module Basic

  class ScalarReference

    include WrapValue

    def initialize(identifier)
      @identifier = identifier
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def eval(runtime)
      runtime.get_scalar(@identifier)
    end

    def assign(runtime, value)
      runtime.set_scalar(@identifier, value)
    end

    def read(input_reader)
      @identifier.read(input_reader)
    end

    protected

    def state
      [@identifier]
    end

  end

end
