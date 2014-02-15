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

    rule(:multiply => simple(:_)) do
      Multiply.new
    end

    rule(:divide => simple(:_)) do
      Divide.new
    end

    rule(:add => simple(:_)) do
      Add.new
    end

    rule(:subtract => simple(:_)) do
      Subtract.new
    end

    rule(:eq => simple(:_)) do
      Equal.new
    end

    rule(:ne => simple(:_)) do
      NotEqual.new
    end

    rule(:lt => simple(:_)) do
      Less.new
    end

    rule(:le => simple(:_)) do
      LessOrEqual.new
    end

    rule(:gt => simple(:_)) do
      Greater.new
    end

    rule(:ge => simple(:_)) do
      GreaterOrEqual.new
    end

    rule(:and => simple(:_)) do
      And.new
    end

    rule(:or => simple(:_)) do
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

     rule(:not => simple(:expression)) do
      NotOperation.new(expression)
    end

    rule(:remark => simple(:_)) do
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

    rule(:goto => simple(:_), :integer => simple(:line_number)) do
      GotoStatement.new(line_number.to_i)
    end

    rule(:randomize => simple(:_)) do
      RandomizeStatement.new
    end

    rule(:end => simple(:_)) do
      EndStatement.new
    end

    rule(:input => simple(:_),
         :references => subtree(:references)) do
      InputStatement.new(nil, Array(references))
    end

    rule(:input => simple(:_),
         :prompt => simple(:prompt),
         :references => subtree(:references)) do
      InputStatement.new(prompt, Array(references))
    end

    rule(:dim => simple(:_),
         :references => subtree(:references)) do
      DimStatement.new(Array(references))
    end

    rule(:reference => simple(:reference),
         :from => simple(:from),
         :to => simple(:to),
         :step => simple(:step)) do
      ForStatement.new(reference, from, to, step)
    end

    rule(:next => simple(:_),
         :references => subtree(:references)) do
      Array(references || [nil]).map do |reference|
        NextStatement.new(reference)
      end
    end

    rule(:on_goto => simple(:_),
         :reference => simple(:reference),
         :line_numbers => subtree(:line_numbers)) do
      OnGotoStatement.new(reference, Array(line_numbers))
    end

    rule(:data_items => subtree(:data_items)) do
      DataStatement.new(Array(data_items))
    end

    rule(:read => simple(:_),
         :references => subtree(:references)) do
      ReadStatement.new(Array(references))
    end

    rule(:condition => simple(:condition),
         :line_number => simple(:line_number)) do
      IfStatement.new(condition, GotoStatement.new(line_number.to_i))
    end

    rule(:condition => simple(:condition),
         :statement => simple(:statement)) do
      IfStatement.new(condition, statement)
    end

    rule(:integer => simple(:line_number),
         :statements => subtree(:statements)) do
      Line.new(line_number.to_i, Array(statements).flatten)
    end

    rule(:gosub => simple(:_),
         :line_number => simple(:line_number)) do
      GosubStatement.new(line_number.to_i)
    end

    rule(:stop => simple(:_)) do
      StopStatement.new
    end

    rule(:return => simple(:_)) do
      ReturnStatement.new
    end

    rule(:program => subtree(:lines)) do
      Program.new(Array(lines))
    end

  end

end
