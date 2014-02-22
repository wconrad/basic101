module Basic101

  class Input

    def initialize(file = $stdout)
      @file = file
    end

    def read_line
      unless line = @file.gets
        raise NoMoreInputError, 'No more input'
      end
      line.chomp
    end

  end

end
