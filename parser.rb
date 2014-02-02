module Basic

  class Parser < Parslet::Parser
    rule(:space) {match(' ').repeat(1)}
    rule(:space?) {space.maybe}
    rule(:printable) {match('[[:print:]]')}
    rule(:integer) {match('[0-9]').repeat(1).as(:integer)}
    rule(:string) {str('"') >> match('[^"]').repeat(0).as(:string) >> str('"')}
    rule(:expression) {string}
    rule(:remark) {(str('REM') >> printable.repeat(0)).as(:remark)}
    rule(:print) {str('PRINT').as(:print)}
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
