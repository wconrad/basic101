module Basic101

  class Parser < Parslet::Parser

    rule(:statements) do
      statement >>
        (space? >> str(':') >>
         space? >> statement).repeat(0) >>
        space? >> str(':').maybe
    end

    rule(:statement) do
      (goto_statement |
       remark_statement |
       print_statement |
       if_statement |
       randomize_statement |
       input_statement |
       end_statement |
       dim_statement |
       for_statement |
       next_statement |
       on_goto_statement |
       data_statement |
       read_statement |
       gosub_statement |
       return_statement |
       stop_statement |
       restore_statement |
       define_function_statement |
       let_statement)
    end

  end

end
