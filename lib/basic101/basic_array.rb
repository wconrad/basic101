# frozen_string_literal: true

module Basic101

  class BasicArray

    def initialize(num_dimensions, default)
      @default = default
      dimension [10] * num_dimensions
    end

    def dimension(max_indices)
      check_max_indices(max_indices)
      @max_indices = max_indices
      @array = make_array(max_indices)
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

    def make_array(max_indices)
      if max_indices.size == 0
        @default
      else
        Array.new(max_indices.first + 1) do
          make_array(max_indices[1..-1])
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

    def check_max_indices(max_indices)
      max_indices.each do |max_index|
        raise ArraySizeError if max_index < 0
      end
    end

    def check_indices(indices)
      raise IndexError unless indices.size == @max_indices.size
      indices.zip(@max_indices).each do |index, dimension|
        raise IndexError unless (0..dimension).include?(index)
      end
    end

  end

end
