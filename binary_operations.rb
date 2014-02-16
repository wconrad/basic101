module Basic

  class BinaryOperations

    def initialize(left, operations)
      @left = left
      @operations = operations
    end

    def eval(runtime)
      @operations.inject(@left) do |result, operation|
        operation.operate(result, runtime)
      end
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      [@left, @operations]
    end

  end

end
