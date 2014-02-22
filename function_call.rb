module Basic

  class FunctionCall

    def initialize(identifier, arguments)
      @identifier = identifier
      @arguments = arguments
    end

    def eval(runtime)
      runtime.call_function(@identifier, argument_values(runtime))
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      state == other.state
    end

    protected

    def state
      [@identifier, @arguments]
    end

    private

    def argument_values(runtime)
      @arguments.map do |argument|
        argument.eval(runtime)
      end
    end

  end

end
