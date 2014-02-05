require_relative 'wrap_value'

module Basic

  #TODO - delete?
  class NumericOperation

    include WrapValue

    def initialize(*args)
      @args = args
      @left = @args[0]
      @right = @args[1]
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    def eval(program)
      arg_values = @args.map do |arg|
        arg.eval(program).value
      end
      result = operate(*arg_values)
      wrap_value(result)
    end

    protected

    def state
      @args
    end

  end

end
