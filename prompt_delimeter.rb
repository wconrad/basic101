module Basic

  class PromptDelimeter

    def print(output)
      output.print '? '
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
