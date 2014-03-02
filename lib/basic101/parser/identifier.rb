module Basic101

  class Parser < Parslet::Parser

    rule(:identifier) do
      string_identifier | numeric_identifier
    end

    rule(:numeric_identifier) do
      base_identifier.as(:numeric_identifier)
    end

    rule(:string_identifier) do
      (base_identifier >> str('$')).as(:string_identifier)
    end

    rule(:function_identifier) do
      user_defined_function_identifier | 
        built_in_function_identifier
    end

    rule(:user_defined_function_identifier) do
      (str('FN') >> base_identifier >>
       str('$').maybe).as(:function_identifier)
    end

    rule(:built_in_function_identifier) do
      (str('ABS') |
       str('ASC') |
       str('CHR$') |
       str('COS') |
       str('EXP') |
       str('INT') |
       str('LEFT$') |
       str('LEN') |
       str('LOG') |
       str('MID$') |
       str('RIGHT$') |
       str('RND') |
       str('SGN') |
       str('SIN') |
       str('SQR') |
       str('STR$') |
       str('TAB') |
       str('TAN') |
       str('VAL')).as(:function_identifier)
    end

    rule(:base_identifier) do
      (keyword.absent? >> match('[A-Z]')) >>
        (keyword.absent? >> match('[A-Z0-9]')).repeat(0)
    end

    rule(:keyword) do
      str('AND') |
        str('DATA') |
        str('DEF') |
        str('DIM') |
        str('ELSE') |
        str('ELSE') |
        str('END') |
        str('FOR') |
        str('GOSUB') |
        str('GOTO') |
        str('GOTO') |
        str('IF') |
        str('INPUT') |
        str('LET') |
        str('NEXT') |
        str('NOT') |
        str('ON') |
        str('OR') |
        str('PRINT') |
        str('RANDOMIZE') |
        str('READ') |
        str('REM') |
        str('RESTORE') |
        str('RETURN') |
        str('STEP') |
        str('STOP') |
        str('THEN') |
        str('TO')
    end

  end

end
