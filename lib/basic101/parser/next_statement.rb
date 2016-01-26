# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:next_statement) do
      str('NEXT').as(:next) >>
        (space? >> reference >>
         (space? >> str(',') >>
          space? >> reference
          ).repeat(0)
         ).maybe.as(:references)
    end

  end

end
