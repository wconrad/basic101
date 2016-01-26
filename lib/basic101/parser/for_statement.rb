# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:for_statement) do
      str('FOR') >>
        space? >> scalar_reference.as(:reference) >>
        space? >> str('=') >>
        space? >> expression.as(:from) >>
        space? >> str('TO') >>
        space? >> expression.as(:to) >>
        (space? >> str('STEP') >> space? >> expression).maybe.as(:step)
    end

  end

end
