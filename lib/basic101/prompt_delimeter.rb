# frozen_string_literal: true

module Basic101

  class PromptDelimeter

    include Identity

    def print(output)
      output.print '? '
    end

  end

end
