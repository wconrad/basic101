# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:goto_statement) do
      str('GOTO').as(:goto) >> space? >> integer
    end

  end

end
