module Basic

  class NullPromptDelimeter

    def print(output)
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
