module Basic

  class BasicArray

    attr_reader :dimensions

    def initialize(num_dimensions, default)
      @default = default
      dimensions = [10] * num_dimensions
      dimension(dimensions)
    end

    def dimensions
      result = []
      array_dimensions(result, @array)
      result
    end

    def dimension(dimensions)
      @array = make_array(dimensions)
    end

    def get(indices)
      get_array(@array, indices)
    end

    def set(indices, value)
      set_array(@array, value, indices)
    end

    private

    def make_array(dimensions)
      if dimensions.size == 0
        @default
      else
        Array.new(dimensions.first) do
          make_array(dimensions[1..-1])
        end
      end
    end

    def get_array(a, indices)
      if indices.size == 0
        a
      else
        get_array(a[indices.first.to_i], indices[1..-1])
      end
    end

    def set_array(a, value, dimensions)
      if dimensions.size == 1
        a[dimensions.first] = value
      else
        set_array(a[dimensions.first], value, dimensions[1..-1])
      end
    end

    def array_dimensions(result, array)
      return unless array.is_a?(Array)
      result << array.size
      array_dimensions(result, array.first)
    end

  end

end
