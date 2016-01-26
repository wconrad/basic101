# frozen_string_literal: true

module Basic101

  class Input

    def initialize(output, file = $stdout)
      @file = file
      @output = output
      @transcript = NullTranscript.new
    end

    def transcript=(transcript)
      @transcript = transcript
    end

    def read_line
      unless line = @file.gets
        @transcript.save_output "\n"
        echo "\n"
        raise NoMoreInputError, 'No more input'
      end
      @transcript.save_input line
      @transcript.save_output line
      echo line
      line.chomp
    end

    private

    def echo(s)
      return unless echo?
      @output.echo s
    end

    def isatty
      @file.isatty
    end

    def echo?
      !(isatty && @output.isatty)
    end

  end

end
