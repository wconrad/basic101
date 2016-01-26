# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:on_goto_statement) do
      str('ON').as(:on_goto) >>
        space? >>expression.as(:expression) >>
        space? >> str('GOTO') >>
        (
         space? >> integer >>
         (
          space? >> str(',') >>
          space? >> integer
          ).repeat(0)
         ).as(:line_numbers)
    end

  end

end
