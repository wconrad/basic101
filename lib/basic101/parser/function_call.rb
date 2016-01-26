# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:function_call) do
      function_identifier.as(:function_identifier) >> space? >> 
        str('(') >> space? >> argument_list.as(:argument_list) >>
        space? >> str(')')
    end

  end

end
