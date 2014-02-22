module Basic101

  class ArrayReference < Reference

    def initialize(identifier, arguments)
      super(identifier)
      @arguments = arguments
    end

    def eval(runtime)
      get_array(runtime).get(indices(runtime))
    end

    def assign(runtime, value)
      get_array(runtime).set(indices(runtime), value)
    end

    def dimension_array(runtime)
      get_array(runtime).dimension(indices(runtime))
    end

    protected

    def state
      super + [@arguments]
    end

    private

    def get_array(runtime)
      runtime.get_array(@identifier, num_dimensions)
    end

    def num_dimensions
      @arguments.size
    end

    def indices(runtime)
      argument_values(runtime).map(&:to_integer).map(&:to_i)
    end

    def argument_values(runtime)
      @arguments.map do |argument|
        argument.eval(runtime)
      end
    end

  end

end
