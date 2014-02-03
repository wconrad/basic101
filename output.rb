module Basic

  class Output

    def initialize(file = $stdout)
      @file = file
    end

    def print_string(s)
      @file.print s
    end

    def print_new_line
      @file.puts
    end

    def print_tab
      #TODO - Make tabs be 14 or 15 spaces apart (whatever GW basic does)
      print_string "\t"
    end

  end

end
