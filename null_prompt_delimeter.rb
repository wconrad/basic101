module Basic

  class NullPromptDelimeter

    def ==(other)
      other.is_a?(self.class)
    end

    def print(output)
    end

  end

end
