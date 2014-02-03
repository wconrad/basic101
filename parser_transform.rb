require_relative 'remark_statement'
require_relative 'print_statement'

module Basic

  class ParserTransform < Parslet::Transform
    rule(:integer => simple(:integer)) {integer.to_i}
    rule(:string => simple(:s)) {BasicString.new(s)}
    rule(:remark => simple(:x)) {RemarkStatement.new}
    rule(:print_separator => ';') {PrintNull.new}
    rule(:print_separator => ',') {PrintTab.new}
    rule(:print => simple(:x)) {PrintStatement.new}
    rule(:line_number => simple(:line_number),
         :statements => subtree(:statements)) do
      s = Array(statements)
      s.first.line_number = line_number
      s
    end
  end

end
