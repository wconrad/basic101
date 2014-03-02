module Basic101

  class Parser < Parslet::Parser

    rule(:read_statement) do
      str('READ').as(:read) >>
        space? >> reference_list.as(:references)
    end

  end

end
