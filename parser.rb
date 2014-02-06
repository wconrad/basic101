module Basic

  class Parser < Parslet::Parser

    rule(:space) do
      match(' ').repeat(1)
    end

    rule(:space?) do
      space.maybe
    end

    rule(:printable) do
      match('[[:print:]]')
    end

    rule(:decimal) do
      match('[0-9]').repeat(1)
    end

    rule(:sign)  do
      match('[+-]')
    end

    rule(:integer) do
      (sign.maybe >> decimal).as(:integer)
    end

    rule(:float) do
      (sign.maybe >> decimal >> str('.') >> decimal).as(:float)
    end

    rule(:string) do
      str('"') >> match('[^"]').repeat(0).as(:string) >> str('"')
    end

    rule(:identifier) do
      match('[A-Z]') >> match('[A-Z0-9$]').repeat(0)
    end

    rule(:argument_list) do
      expression >> (space? >> str(',') >> space? >> expression).repeat(0)
    end

    rule(:subscript_reference) do
      identifier.as(:subscript_base) >> space? >> 
        str('(') >> space? >> argument_list.as(:argument_list) >>
        space? >> str(')')
    end

    rule(:scalar_reference) do
      identifier.as(:scalar_reference)
    end

    rule(:reference) do
      subscript_reference | scalar_reference
    end

    rule(:let) do
      reference.as(:lvalue) >> space? >> 
        str('=') >> space? >> expression.as(:rvalue)
    end

    rule(:factor) do
      string | float | integer | reference |
        str('(') >> space? >> expression >> space? >> str(')')
    end

    rule(:multiply_op) do
      str('*').as(:multiply) | str('/').as(:divide)
    end

    rule(:addition_op) do
      str('+').as(:add) | str('-').as(:subtract)
    end

    rule(:comparison_op) do
      (str('=').as(:eq) |
       str('<>').as(:ne) |
       str('>=').as(:ge) |
       str('<=').as(:le)) |
       str('<').as(:lt) |
       str('>').as(:gt)
    end

    rule(:term) do
      factor.as(:left) >>
        (space? >> multiply_op.as(:operator) >>
         space? >> factor.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:simple_expression) do
      term >>
        (space? >> addition_op.as(:operator) >>
         space? >> term.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:expression) do
      simple_expression >>
        (space? >> comparison_op.as(:operator) >>
         space? >> factor.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:remark) do
      (str('REM') >> printable.repeat(0)).as(:remark)
    end

    rule(:print_arguments) do
      (space? >> (expression | print_separator)).repeat(0)
    end

    rule(:print_separator) do
      match('[;,]').as(:print_separator)
    end

    rule(:print) do
      str('PRINT') >> print_arguments.as(:print_arguments)
    end

    rule(:goto) do
      str('GOTO').as(:goto) >> space? >> integer
    end

    rule(:statement) do
      goto | remark | print | let
    end

    rule(:statements) do
      statement >>
        (space? >> str(':') >> space? >> statement).repeat(0) >> space?
    end

    rule(:line) do
      integer >> space? >> statements.as(:statements)
    end

    root(:line)

  end

end
