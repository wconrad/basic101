# frozen_string_literal: true

module Basic101

  class UserDefinedFunction < Function

    include Identity

    def initialize(identifier, parameters, expression)
      @identifier = identifier
      @parameters = parameters
      @expression = expression
    end

    def name
      @identifier.to_s
    end

    def call(runtime, args)
      raise InvalidArgumentError unless args.size == @parameters.size
      save_parameters(runtime)
      bind_arguments(runtime, args)
      result = @expression.eval(runtime)
      restore_parameters(runtime)
      result
    end

    protected

    def state
      [@identifier, @parameters, @expression]
    end

    private

    def save_parameters(runtime)
      @original_parameter_values = @parameters.map do |parameter|
        parameter.eval(runtime)
      end
    end

    def bind_arguments(runtime, args)
      @parameters.zip(args).each do |parameter, arg|
        parameter.assign(runtime, arg.eval(runtime))
      end
    end

    def restore_parameters(runtime)
      @parameters.zip(@original_parameter_values) do |parameter, value|
        parameter.assign(runtime, value)
      end
    end

  end

end
