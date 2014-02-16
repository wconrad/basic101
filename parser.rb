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

    rule(:unquoted_string) do
      match('(?=[[:print:]])[^,": ]').repeat(0).as(:string)
    end

    rule(:quoted_string) do
      str('"') >>
        match('(?=[[:print:]])[^"]').repeat(0).maybe.as(:string) >>
        str('"')
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

    rule(:reference_list) do
      reference >> (space? >> str(',') >> space? >> reference).repeat(0)
    end

    rule(:let) do
      (str('LET') >> space?).maybe >>
        reference.as(:lvalue) >> space? >> 
        str('=') >> space? >> expression.as(:rvalue)
    end

    rule(:factor) do
      quoted_string |
        float |
        integer |
        reference |
        str('(') >> space? >> expression >> space? >> str(')')
    end

    rule(:multiply_op) do
      (str('*').as(:multiply) |
       str('/').as(:divide))
    end

    rule(:addition_op) do
      (str('+').as(:add) |
       str('-').as(:subtract))
    end

    rule(:comparison_op) do
      (str('=').as(:eq) |
       str('<>').as(:ne) |
       str('>=').as(:ge) |
       str('<=').as(:le)) |
       str('<').as(:lt) |
       str('>').as(:gt)
    end

    rule(:and_op) do
      str('AND').as(:and)
    end

    rule(:or_op) do
      str('OR').as(:or)
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

    rule(:comparison_expression) do
      simple_expression.as(:left) >>
        (space? >> comparison_op.as(:operator) >>
         space? >> simple_expression.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:not_expression) do
      (str('NOT') >> space? >> comparison_expression).as(:not) |
        comparison_expression
    end

    rule(:and_expression) do
      not_expression.as(:left) >>
        (space? >> and_op.as(:operator) >>
         space? >> not_expression.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:or_expression) do
      and_expression.as(:left) >>
        (space? >> or_op.as(:operator) >>
         space? >> and_expression.as(:right)
         ).repeat(1).as(:operations).maybe
    end

    rule(:expression) do
      or_expression
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
      str('IF') >>
        space? >> expression.as(:condition) >> 
        space? >> str('THEN') >>
        space? >>
        (integer.as(:line_number) | statement.as(:statement))
    end

    rule(:randomize) do
      str('RANDOMIZE').as(:randomize)
    end

    rule(:input) do
      str('INPUT').as(:input) >>
        (space? >> quoted_string.as(:prompt) >> space? >> str(';')).maybe >>
        space? >> reference_list.as(:references)
    end

    rule(:end_statement) do
      str('END').as(:end)
    end

    rule(:dim_statement) do
      str('DIM').as(:dim) >>
        (space? >> subscript_reference >>
         (space? >> str(',') >>
          space? >> subscript_reference
          ).repeat(0)
         ).as(:references)
    end

    rule(:for_statement) do
      str('FOR') >>
        space? >> scalar_reference.as(:reference) >>
        space? >> str('=') >>
        space? >> expression.as(:from) >>
        space? >> str('TO') >>
        space? >> expression.as(:to) >>
       (space? >> str('STEP') >> space >> expression).maybe.as(:step)
    end

    rule(:next_statement) do
      str('NEXT').as(:next) >>
        (space? >> reference >>
         (space? >> str(',') >>
          space? >> reference
          ).repeat(0)
         ).maybe.as(:references)
    end

    rule(:on_goto_statement) do
      str('ON').as(:on_goto) >>
        space? >>reference.as(:reference) >>
        space? >> str('GOTO') >>
        (
         space? >> integer >>
         (
          space? >> str(',') >>
          space? >> integer
          ).repeat(0)
         ).as(:line_numbers)
    end

    rule(:data_item) do
      float | integer | quoted_string | unquoted_string
    end

    rule(:data_statement) do
      str('DATA') >>
        (space? >> data_item >> 
         (space? >> str(',') >>
          space? >> data_item
          ).repeat(0)
         ).as(:data_items)
    end

    rule(:read_statement) do
      str('READ').as(:read) >>
        space? >> reference_list.as(:references)
    end

    rule(:gosub_statement) do
      str('GOSUB').as(:gosub) >>
        space? >> integer.as(:line_number)
    end

    rule(:return_statement) do
      str('RETURN').as(:return)
    end

    rule(:stop_statement) do
      str('STOP').as(:stop)
    end

    rule(:statement) do
      (goto |
       remark |
       print |
       if_statement |
       randomize |
       input |
       end_statement |
       dim_statement |
       for_statement |
       next_statement |
       on_goto_statement |
       data_statement |
       read_statement |
       gosub_statement |
       return_statement |
       stop_statement |
       let)
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
