# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class RandomizeStatement < Statement

    def execute(runtime)
      srand
    end

  end

end
