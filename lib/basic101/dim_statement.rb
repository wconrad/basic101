# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class DimStatement < Statement

    def initialize(array_references)
      @array_references = array_references
    end

    def execute(runtime)
      @array_references.each do |reference|
        reference.dimension_array runtime
      end
    end

    protected

    def state
      [@array_references]
    end

  end

end
