# frozen_string_literal: true

module Basic101

  class FunctionCall

    include Identity

    def initialize(identifier, arguments)
      @identifier = identifier
      @arguments = arguments
    end

    def eval(runtime)
      runtime.call_function(@identifier, argument_values(runtime))
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
