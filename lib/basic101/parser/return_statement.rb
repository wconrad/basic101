module Basic101

  class Parser < Parslet::Parser

    rule(:return_statement) do
      str('RETURN').as(:return)
    end

  end

end
