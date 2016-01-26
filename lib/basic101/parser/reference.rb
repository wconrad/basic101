# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:scalar_reference_list) do
      scalar_reference >>
        (space? >> str(',') >>
         space? >> scalar_reference).repeat(0)
    end

    rule(:reference_list) do
      reference >> (space? >> str(',') >> space? >> reference).repeat(0)
    end

    rule(:reference) do
      array_reference | scalar_reference
    end

    rule(:array_reference) do
      identifier.as(:subscript_base) >> space? >> 
        str('(') >> space? >> argument_list.as(:argument_list) >>
        space? >> str(')')
    end

    rule(:scalar_reference) do
      identifier.as(:scalar_reference)
    end

    rule(:argument_list) do
      expression >> (space? >> str(',') >> space? >> expression).repeat(0)
    end

  end

end

