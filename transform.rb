require_relative 'remark_statement'
require_relative 'print_statement'

module Basic

  class Transform < Parslet::Transform
    rule(:integer => simple(:integer)) {integer.to_i}
    rule(:string => simple(:s)) {BasicString.new(s)}
    rule(:function_identifier => simple(:identifier), 
         :argument_list => subtree(:args)) do
      FunctionCall.new(identifier, Array(args))
    end
    rule(:remark => simple(:x)) {RemarkStatement.new}
    rule(:print_separator => ';') {PrintNull.new}
    rule(:print_separator => ',') {PrintTab.new}
    rule(:print_arguments => sequence(:args)) do
      PrintStatement.new(nil, args)
    end
    rule(:print => simple(:print), :print_arg => simple(:x)) do
      PrintStatement.new(nil, Array(x))
    end
    rule(:line_number => simple(:line_number),
         :statements => subtree(:statements)) do
      s = Array(statements)
      s.first.line_number = line_number
      s
    end
  end

end
