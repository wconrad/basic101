# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:unquoted_string) do
      match('(?=[[:print:]])[^,": ]').repeat(0).as(:string)
    end

    rule(:quoted_string) do
      str('"') >>
        match('(?=[[:print:]])[^"]').repeat(0).maybe.as(:string) >>
        str('"')
    end

  end

end
