# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:end_statement) do
      str('END').as(:end)
    end

  end

end
