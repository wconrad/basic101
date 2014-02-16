module Basic

  class PromptDelimeter

    def ==(other)
      other.is_a?(self.class)
    end

    def print(output)
      output.print '? '
    end

  end

end
