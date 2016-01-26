# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:dim_statement) do
      str('DIM').as(:dim) >>
        (space? >> array_reference >>
         (space? >> str(',') >>
          space? >> array_reference
          ).repeat(0)
         ).as(:references)
    end

  end

end
