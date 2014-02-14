require_relative 'remark_statement'
require_relative 'print_statement'

module Basic

  class Transform < Parslet::Transform

    rule(:integer => simple(:i)) do
      BasicInteger.new(i.to_i)
    end

    rule(:float => simple(:f)) do
      BasicFloat.new(f.to_f)
    end

    rule(:string => simple(:s)) do
      BasicString.new(s)
    end

    rule(:numeric_identifier => simple(:name)) do
      NumericIdentifier.new(name)
    end

    rule(:string_identifier => simple(:name)) do
      StringIdentifier.new(name)
    end

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

    rule(:eq => simple(:x)) do
      Equal.new
    end

    rule(:ne => simple(:x)) do
      NotEqual.new
    end

    rule(:lt => simple(:x)) do
      Less.new
    end

    rule(:le => simple(:x)) do
      LessOrEqual.new
    end

    rule(:gt => simple(:x)) do
      Greater.new
    end

    rule(:ge => simple(:x)) do
      GreaterOrEqual.new
    end

    rule(:and => simple(:x)) do
      And.new
    end

    rule(:or => simple(:x)) do
      Or.new
    end

    rule(:operator => simple(:operator),
         :right => simple(:right)) do
      BinaryOperation.new(operator, right)
    end

    rule(:left => simple(:left),
         :operations => sequence(:operations)) do
      BinaryOperations.new(left, operations)
    end

    rule(:left => simple(:left)) do
      left
    end

     rule(:not => simple(:x)) do
      NotOperation.new(x)
    end

    rule(:remark => simple(:x)) do
      RemarkStatement.new
    end

    rule(:print_separator => ';') do
      PrintNull.new
    end

    rule(:print_separator => ',') do
      PrintTab.new
    end

    rule(:print_arguments => sequence(:args)) do
      PrintStatement.new(args)
    end

    rule(:lvalue => simple(:lvalue), :rvalue => simple(:rvalue)) do
      LetStatement.new(lvalue, rvalue)
    end

    rule(:goto => simple(:x), :integer => simple(:line_number)) do
      GotoStatement.new(line_number.to_i)
    end

    rule(:randomize => simple(:x)) do
      RandomizeStatement.new
    end

    rule(:end => simple(:x)) do
      EndStatement.new
    end

    rule(:input => simple(:x),
         :references => subtree(:references)) do
      InputStatement.new(nil, Array(references))
    end

    rule(:input => simple(:x),
         :prompt => simple(:prompt),
         :references => subtree(:references)) do
      InputStatement.new(prompt, Array(references))
    end

    rule(:dim => simple(:x),
         :reference => subtree(:references)) do
      DimStatement.new(Array(references))
    end

    rule(:condition => simple(:condition),
         :if_true => simple(:true_target)) do
      IfStatement.new(condition, true_target)
    end

    rule(:integer => simple(:line_number),
         :statements => subtree(:statements)) do
      Line.new(line_number.to_i, Array(statements))
    end

    rule(:program => subtree(:lines)) do
      Program.new(Array(lines))
    end

  end

end
