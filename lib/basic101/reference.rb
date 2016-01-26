# frozen_string_literal: true

require_relative 'identity'

module Basic101

  class Reference

    include Identity

    def initialize(identifier)
      @identifier = identifier
    end

    def input(input_reader)
      @identifier.input(input_reader)
    end

    protected

    def state
      [@identifier]
    end

  end

end
