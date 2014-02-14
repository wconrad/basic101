module Basic

  class BasicArray

    attr_reader :dimensions

    def initialize(num_dimensions, default)
      @default = default
      dimension [10] * num_dimensions
    end

    def dimension(dimensions)
      check_dimensions(dimensions)
      @dimensions = dimensions
      @array = make_array(dimensions)
    end

    def get(indices)
      check_indices(indices)
      array_get(@array, indices)
    end

    def set(indices, value)
      check_indices(indices)
      array_set(@array, value, indices)
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

    def array_get(a, indices)
      if indices.size == 0
        a
      else
        array_get(a[indices.first.to_i], indices[1..-1])
      end
    end

    def array_set(a, value, indices)
      if indices.size == 1
        a[indices.first] = value
      else
        array_set(a[indices.first], value, indices[1..-1])
      end
    end

    def check_dimensions(dimensions)
      dimensions.each do |dimension|
        raise ArraySizeError if dimension <= 0
      end
    end

    def check_indices(indices)
      raise IndexError unless indices.size == dimensions.size
      indices.zip(dimensions).each do |index, dimension|
        raise IndexError unless (0...dimension).include?(index)
      end
    end

  end

end
