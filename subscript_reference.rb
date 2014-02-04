module Basic

  class SubscriptReference

    def initialize(identifier, arguments)
      @identifier = identifier
      @arguments = arguments
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def eval(program)
      function = program.functions[@identifier.to_s]
      unless function
        raise UndefinedFunction, "Undefined function #{@identifier }"
      end
      argument_values = @arguments.map do |argument|
        argument.eval(program)
      end
      function.call(program, argument_values)
    end

    protected

    def state
      [@identifier, @arguments]
    end

  end

end
