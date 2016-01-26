# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    root(:program)

    rule(:program) do
      ((line >> (new_line >> line).repeat(0) >> new_line.maybe).maybe).as(:program)
    end

    rule(:line) do
      (integer >> space? >> statements.as(:statements))
    end

  end

end
