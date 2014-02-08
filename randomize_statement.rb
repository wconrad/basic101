require_relative 'statement'

module Basic

  class RandomizeStatement < Statement

    def ==(other)
      other.is_a?(self.class)
    end

    def execute(program)
      srand
    end

  end

end
