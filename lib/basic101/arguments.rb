module Basic101

  class Arguments

    attr_reader :transcript
    attr_reader :filenames

    def initialize(argv)
      @transcript = false
      OptionParser.new do |opts|
        opts.banner << " [PATH]..."
        opts.on('-t', '--transcript') do |v|
          @transcript = v
        end
      end.parse!(argv)
      @filenames = argv.dup
    rescue OptionParser::ParseError => e
      $stderr.puts e
      exit 1
    end

  end

end
