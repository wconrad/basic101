# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:remark_statement) do
      (str('REM') >> printable.repeat(0)).as(:remark)
    end

  end

end
