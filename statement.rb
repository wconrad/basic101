module Basic

  class Statement

    attr_writer :index

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
