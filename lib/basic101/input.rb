module Basic101

  class Input

    def initialize(output, file = $stdout)
      @file = file
      @output = output
    end

    def read_line
      unless line = @file.gets
        echo "\n"
        raise NoMoreInputError, 'No more input'
      end
      echo line
      line.chomp
    end

    private

    def echo(s)
      return if isatty && @output.isatty
      @output.print s
    end

    def isatty
      @file.isatty
    end

  end

end
