require_relative 'remark_statement'
require_relative 'print_statement'

module Basic

  class ParserTransform < Parslet::Transform
    rule(:remark => simple(:x)) {RemarkStatement.new}
    rule(:print => simple(:x)) {PrintStatement.new}
    rule(:line_number => simple(:line_number),
         :statements => subtree(:statements)) do
      s = Array(statements)
      s.first.line_number = line_number.to_i
      s
    end
  end

end
