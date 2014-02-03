module Basic

  class PrintNull

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
