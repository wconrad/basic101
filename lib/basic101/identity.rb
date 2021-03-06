# frozen_string_literal: true

module Basic101

  module Identity

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      []
    end

  end

end
