module Basic101

  class Parser < Parslet::Parser

    rule(:gosub_statement) do
      str('GOSUB').as(:gosub) >>
        space? >> integer.as(:line_number)
    end

  end

end
