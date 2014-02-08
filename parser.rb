module Basic

  class Parser < Parslet::Parser

    rule(:space) do
      match(' ').repeat(1)
    end

    rule(:new_line) do
      str("\r").maybe >> str("\n")
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

    rule(:base_identifier) do
      match('[A-Z]') >> match('[A-Z0-9]').repeat(0)
    end

    rule(:numeric_identifier) do
      base_identifier.as(:numeric_identifier)
    end

    rule(:string_identifier) do
      (base_identifier >> str('$')).as(:string_identifier)
    end

    rule(:identifier) do
      string_identifier | numeric_identifier
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
      term.as(:left) >>
        (space? >> addition_op.as(:operator) >>
         space? >> term.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:expression) do
      simple_expression.as(:left) >>
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

    rule(:if_statement) do
      str('IF') >> space? >> expression.as(:condition) >> 
        space? >> str('THEN') >> space? >> integer.as(:if_true)
    end

    rule(:randomize) do
      str('RANDOMIZE').as(:randomize)
    end

    rule(:input) do
      str('INPUT').as(:input) >>
        (space? >> string.as(:prompt) >> space? >> str(';')).maybe >>
        space? >> reference.as(:reference)
    end

    rule(:end_statement) do
      str('END').as(:end)
    end

    rule(:statement) do
      goto | remark | print | let | if_statement | randomize | input |
        end_statement
    end

    rule(:statements) do
      statement >>
        (space? >> str(':') >> space? >> statement).repeat(0) >> space?
    end

    rule(:line) do
      (integer >> space? >> statements.as(:statements))
    end

    rule(:program) do
      ((line >> (new_line >> line).repeat(0) >> new_line.maybe).maybe).as(:program)
    end

    root(:program)

  end

end
