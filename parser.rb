module Basic

  class Parser < Parslet::Parser
    rule(:space) {match(' ').repeat(1)}
    rule(:space?) {space.maybe}
    rule(:printable) {match('[[:print:]]')}
    rule(:integer) {match('[0-9]').repeat(1).as(:integer)}
    rule(:string) {str('"') >> match('[^"]').repeat(0).as(:string) >> str('"')}
    rule(:identifier) do
      match('[A-Z]') >> match('[A-Z0-9$]').repeat(0)
    end
    rule(:argument_list) do
      expression >> (space? >> str(',') >> space? >> expression).repeat(0)
    end
    rule(:subscript_reference) do
      identifier.as(:function_identifier) >> space? >> 
        str('(') >> space? >> argument_list.as(:argument_list) >>
        space? >> str(')')
    end
    rule(:expression) {string | integer | subscript_reference}
    rule(:remark) {(str('REM') >> printable.repeat(0)).as(:remark)}
    rule(:print_arguments) do
      (space? >> (expression | print_separator)).repeat(0)
    end
    rule(:print_separator) {match('[;,]').as(:print_separator)}
    rule(:print) do
      str('PRINT') >> print_arguments.as(:print_arguments)
    end
    rule(:statement) {(remark | print) >> space?}
    rule(:statements) do
      statement >> (str(':') >> space? >> statement).repeat(0)
    end
    rule(:line) do
      integer.as(:line_number) >> space? >> statements.as(:statements)
    end
    root(:line)
  end

end
