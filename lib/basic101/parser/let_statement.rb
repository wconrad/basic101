# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:let_statement) do
      (str('LET') >> space?).maybe >>
        reference.as(:lvalue) >> space? >> 
        str('=') >> space? >> expression.as(:rvalue)
    end

  end

end
