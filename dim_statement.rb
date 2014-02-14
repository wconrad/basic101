require_relative 'statement'

module Basic

  class DimStatement < Statement

    def initialize(subscript_references)
      @subscript_references = subscript_references
    end

    def execute(program)
      @subscript_references.each do |reference|
        reference.dimension_array program
      end
    end

    protected

    def state
      [@subscript_references]
    end

  end

end
