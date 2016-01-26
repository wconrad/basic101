# frozen_string_literal: true

module Basic101

  class Parser < Parslet::Parser

    rule(:data_statement) do
      str('DATA') >>
        (space? >> data_item >> 
         (space? >> str(',') >>
          space? >> data_item
          ).repeat(0)
         ).as(:data_items)
    end

    rule(:data_item) do
      float | integer | quoted_string | unquoted_string
    end

  end

end
