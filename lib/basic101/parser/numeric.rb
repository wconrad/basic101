module Basic101

  class Parser < Parslet::Parser

    rule(:float) do
      (fixed >> exponent.maybe |
       sign.maybe >> decimal >> exponent).as(:float)
    end

    rule(:integer) do
      (sign.maybe >> decimal).as(:integer)
    end

    rule(:decimal) do
      match('[0-9]').repeat(1)
    end

    rule(:sign)  do
      match('[+-]')
    end

    rule(:fixed) do
      sign.maybe >>
        (decimal >> str('.') >> decimal.maybe) |
        (str('.') >> decimal)
    end

    rule(:exponent) do
      str('E') >> sign.maybe >> decimal
    end

  end

end
