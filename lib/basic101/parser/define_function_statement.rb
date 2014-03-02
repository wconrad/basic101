module Basic101

  class Parser < Parslet::Parser

    rule(:define_function_statement) do
      str('DEF').as(:def) >>
        space? >> user_defined_function_identifier.as(:identifier) >>
        (space? >> str('(') >>
         space? >> scalar_reference_list >>
         space? >> str(')')
         ).as(:parameters) >>
        space? >> str('=') >>
        space? >> expression.as(:expression)
    end

  end

end
