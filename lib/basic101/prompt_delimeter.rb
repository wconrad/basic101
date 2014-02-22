module Basic101

  class PromptDelimeter

    def print(output)
      output.print '? '
    end

    def ==(other)
      other.is_a?(self.class)
    end

  end

end
