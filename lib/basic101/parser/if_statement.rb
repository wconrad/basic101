module Basic101

  class Parser < Parslet::Parser

    rule(:if_statement) do
      str('IF').as(:if) >>
        space? >> expression.as(:condition) >> 
        (space? >> str('THEN')).maybe >>
        space? >> if_block.as(:then_block) >>
        (space? >> str('ELSE') >> space? >> if_block).maybe.as(:else_block)
    end

    rule(:if_block) do
      (integer.as(:if_line_number) |
       statements)
    end

  end

end
