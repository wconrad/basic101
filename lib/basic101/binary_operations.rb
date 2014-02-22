module Basic101

  class BinaryOperations

    include Identity

    def initialize(left, operations)
      @left = left
      @operations = operations
    end

    def eval(runtime)
      @operations.inject(@left) do |result, operation|
        operation.operate(result, runtime)
      end
    end

    protected

    def state
      [@left, @operations]
    end

  end

end
