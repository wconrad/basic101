# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:input_statement) do
      str('INPUT').as(:input) >>
        (space? >> quoted_string.as(:prompt) >>
         space? >> prompt_delimeter.as(:prompt_delimeter)).maybe >>
        space? >> reference_list.as(:references)
    end

    rule(:prompt_delimeter) do
      str(';').as(:prompt_delimeter) |
        str(',').as(:null_prompt_delimeter)
    end

  end

end
