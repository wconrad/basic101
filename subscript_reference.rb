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
      if program.function_exists?(@identifier)
        program.call_function(@identifier, argument_values(program))
      else
        raise UndefinedFunction, "Undefined function or array #{@identifier }"
      end
    end

    protected

    def state
      [@identifier, @arguments]
    end

    def argument_values(program)
      @arguments.map do |argument|
        argument.eval(program)
      end
    end

  end

end
