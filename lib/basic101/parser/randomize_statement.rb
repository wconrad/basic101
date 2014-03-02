module Basic101

  class Parser < Parslet::Parser

    rule(:randomize_statement) do
      str('RANDOMIZE').as(:randomize)
    end

  end

end
