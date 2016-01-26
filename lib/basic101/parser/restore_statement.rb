# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:restore_statement) do
      str('RESTORE').as(:restore) >>
        (space? >> integer).maybe.as(:line_number)
    end

  end

end
