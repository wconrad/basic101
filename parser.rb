module Basic

  class Parser < Parslet::Parser
    rule(:space) {match(' ').repeat(1)}
    rule(:space?) {space.maybe}
    rule(:printable) {match('[[:print:]]')}
    rule(:decimal) {match('[0-9]').repeat(1)}
    rule(:integer) {decimal.as(:integer)}
    rule(:float) {(decimal >> str('.') >> decimal).as(:float)}
    rule(:string) {str('"') >> match('[^"]').repeat(0).as(:string) >> str('"')}
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
    rule(:scalar_reference) {identifier.as(:scalar_reference)}
    rule(:reference) {subscript_reference | scalar_reference}
    rule(:let) do
      reference.as(:lvalue) >> space? >> 
        str('=') >> space? >> expression.as(:rvalue)
    end
    rule(:expression) {string | float | integer | reference}
    rule(:remark) {(str('REM') >> printable.repeat(0)).as(:remark)}
    rule(:print_arguments) do
      (space? >> (expression | print_separator)).repeat(0)
    end
    rule(:print_separator) {match('[;,]').as(:print_separator)}
    rule(:print) do
      str('PRINT') >> print_arguments.as(:print_arguments)
    end
    rule(:goto) do
      str('GOTO').as(:goto) >> space? >> integer
    end
    rule(:statement) {goto | remark | print | let}
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
