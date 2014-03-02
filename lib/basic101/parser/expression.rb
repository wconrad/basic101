module Basic101

  class Parser < Parslet::Parser

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

    rule(:factor) do
      quoted_string |
        float |
        integer |
        function_call |
        reference |
        str('(') >> space? >> expression >> space? >> str(')')
    end

    rule(:power) do
      (factor.as(:left) >>
       space? >> str('^').as(:power) >>
       space? >> power.as(:right)) |
        factor
    end

    rule(:negation) do
      (str('-') >>
       space? >> power).as(:negation) |
        power
    end

    rule(:term) do
      negation.as(:left) >>
        (space? >> multiply_op.as(:operator) >>
         space? >> negation.as(:right)
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

  end

end
