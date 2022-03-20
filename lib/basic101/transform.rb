# frozen_string_literal: true

require_relative 'clear_screen_statement'
require_relative 'remark_statement'
require_relative 'print_statement'

module Basic101

  class Transform < Parslet::Transform

    rule(:integer => simple(:i)) do
      BasicInteger.new(i.to_i)
    end

    rule(:float => simple(:s)) do
      BasicFloat.from_s(s)
    end

    rule(:string => simple(:s)) do
      BasicString.new(s)
    end

    rule(:function_identifier => simple(:name)) do
      FunctionIdentifier.new(name)
    end

    rule(:numeric_identifier => simple(:name)) do
      NumericIdentifier.new(name)
    end

    rule(:string_identifier => simple(:name)) do
      StringIdentifier.new(name)
    end

    rule(:function_identifier => simple(:identifier),
         :argument_list => subtree(:arguments)) do
      FunctionCall.new(identifier, Array(arguments))
    end

    rule(:subscript_base => simple(:identifier), 
         :argument_list => subtree(:args)) do
      ArrayReference.new(identifier, Array(args))
    end

    rule(:scalar_reference => simple(:identifier)) do
      ScalarReference.new(identifier)
    end

    rule(:negation => simple(:expression)) do
      NegateOperation.new(expression)
    end

    rule(:multiply => simple(:_)) do
      :*
    end

    rule(:divide => simple(:_)) do
      :/
    end

    rule(:add => simple(:_)) do
      :+
    end

    rule(:subtract => simple(:_)) do
      :-
    end

    rule(:eq => simple(:_)) do
      :eq
    end

    rule(:ne => simple(:_)) do
      :ne
    end

    rule(:lt => simple(:_)) do
      :lt
    end

    rule(:le => simple(:_)) do
      :le
    end

    rule(:gt => simple(:_)) do
      :gt
    end

    rule(:ge => simple(:_)) do
      :ge
    end

    rule(:and => simple(:_)) do
      :and
    end

    rule(:or => simple(:_)) do
      :or
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

    rule(:left => subtree(:left),
         :power => simple(:_),
         :right => subtree(:right)) do
      PowerOperation.new(left, right)
    end

     rule(:not => simple(:expression)) do
      NotOperation.new(expression)
    end

    rule(:remark => simple(:_)) do
      RemarkStatement.new
    end

    rule(:print_separator => ';') do
      PrintSemicolon.new
    end

    rule(:print_separator => ',') do
      PrintComma.new
    end

    rule(:print => simple(:_),
         :print_arguments => subtree(:args)) do
      PrintStatement.new(Array(args))
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

    rule(:prompt_delimeter => simple(:_)) do
      PromptDelimeter.new
    end

    rule(:null_prompt_delimeter => simple(:_)) do
      NullPromptDelimeter.new
    end

    rule(:input => simple(:_),
         :references => subtree(:references)) do
      InputStatement.new(nil, PromptDelimeter.new, Array(references))
    end

    rule(:input => simple(:_),
         :prompt => simple(:prompt),
         :prompt_delimeter => simple(:prompt_delimeter),
         :references => subtree(:references)) do
      InputStatement.new(prompt, prompt_delimeter, Array(references))
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
         :expression => simple(:expression),
         :line_numbers => subtree(:line_numbers)) do
      OnGotoStatement.new(expression, Array(line_numbers))
    end

    rule(:data_items => subtree(:data_items)) do
      DataStatement.new(Array(data_items))
    end

    rule(:read => simple(:_),
         :references => subtree(:references)) do
      ReadStatement.new(Array(references))
    end

    rule(:if_line_number => simple(:line_number)) do
      GotoStatement.new(line_number.to_i)
    end

    rule(:if => simple(:_),
         :condition => simple(:condition),
         :then_block => subtree(:then_block),
         :else_block => subtree(:else_block)) do
      [
        IfStatement.new(condition),
        then_block,
        ElseStatement.new,
        else_block,
        EndifStatement.new,
      ].flatten.compact
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

    rule(:cls => simple(:_)) do
      ClearScreenStatement.new
    end

    rule(:restore => simple(:_),
         :line_number => simple(:line_number)) do
      RestoreStatement.new(line_number)
    end

    rule(:def => simple(:x),
         :identifier => simple(:identifier),
         :parameters => subtree(:parameters),
         :expression => simple(:expression)) do
      DefineFunctionStatement.new(identifier,
                                  Array(parameters),
                                  expression)
    end

    rule(:program => subtree(:lines)) do
      Program.new(Array(lines))
    end

  end

end
