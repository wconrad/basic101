module Basic101

  class Parser < Parslet::Parser

    rule(:print_statement) do
      str('PRINT').as(:print) >> print_arguments.as(:print_arguments)
    end

    rule(:print_arguments) do
      (space? >> (expression | print_separator)).repeat(0)
    end

    rule(:print_separator) do
      match('[;,]').as(:print_separator)
    end

  end

end
