module Basic

  class Output

    def initialize(file = $stdout)
      @file = file
    end

    #TODO - Make tabs be 14 or 15 spaces apart (whatever GW basic does)
    def print(s)
      @file.print s
    end

  end

end
