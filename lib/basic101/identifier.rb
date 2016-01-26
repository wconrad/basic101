# frozen_string_literal: true

module Basic101

  class Identifier

    include Identity

    def initialize(name)
      @name = name.to_s
    end

    def to_s
      @name
    end

    protected

    def state
      [@name]
    end

  end

end
