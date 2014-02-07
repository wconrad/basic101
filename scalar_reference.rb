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

    def eval(program)
      program.get_variable(@identifier)
    end

    def assign(program, value)
      program.set_variable(@identifier, value)
    end

    def read(input)
      @identifier.read(input)
    end

    protected

    def state
      [@identifier]
    end

  end

end
