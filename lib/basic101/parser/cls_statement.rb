# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:cls_statement) do
      str('CLS').as(:cls)
    end

  end

end
