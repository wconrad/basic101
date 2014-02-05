require_relative 'remark_statement'
require_relative 'print_statement'

module Basic

  class Transform < Parslet::Transform
    rule(:integer => simple(:i)) {BasicInteger.new(i.to_i)}
    rule(:float => simple(:f)) {BasicFloat.new(f.to_f)}
    rule(:string => simple(:s)) {BasicString.new(s)}
    rule(:subscript_base => simple(:identifier), 
         :argument_list => subtree(:args)) do
      SubscriptReference.new(identifier, Array(args))
    end
    rule(:scalar_reference => simple(:identifier)) do
      ScalarReference.new(identifier)
    end
    rule(:multiply => simple(:x)) do
      Multiply.new
    end
    rule(:divide => simple(:x)) do
      Divide.new
    end
    rule(:add => simple(:x)) do
      Add.new
    end
    rule(:subtract => simple(:x)) do
      Subtract.new
    end
    rule(:operator => simple(:operator),
         :right => simple(:right)) do
      BinaryOperation.new(operator, right)
    end
    rule(:left => simple(:left),
         :operations => sequence(:operations)) do
      BinaryOperations.new(left, operations)
    end
    rule(:left => simple(:left)) {left}
    rule(:remark => simple(:x)) {RemarkStatement.new}
    rule(:print_separator => ';') {PrintNull.new}
    rule(:print_separator => ',') {PrintTab.new}
    rule(:print_arguments => sequence(:args)) do
      PrintStatement.new(args)
    end
    rule(:lvalue => simple(:lvalue), :rvalue => simple(:rvalue)) do
      LetStatement.new(lvalue, rvalue)
    end
    rule(:goto => simple(:x), :integer => simple(:line_number)) do
      GotoStatement.new(line_number.to_i)
    end
    rule(:integer => simple(:line_number),
         :statements => subtree(:statements)) do
      s = Array(statements)
      s.first.line_number = line_number.to_i
      s
    end
  end

end
