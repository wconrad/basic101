module Basic101

  class Parser < Parslet::Parser

    rule(:space) do
      match(' ').repeat(1)
    end

    rule(:new_line) do
      str("\r").maybe >> str("\n")
    end

    rule(:space?) do
      space.maybe
    end

    rule(:printable) do
      match('[[:print:]]')
    end

  end

end
