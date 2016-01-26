# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:stop_statement) do
      str('STOP').as(:stop)
    end

  end

end
