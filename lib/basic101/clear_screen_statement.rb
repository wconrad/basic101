# frozen_string_literal: true

require_relative 'statement'

module Basic101

  class ClearScreenStatement < Statement

    def execute(runtime)
      runtime.output.print "<CLS>"
    end

  end

end
