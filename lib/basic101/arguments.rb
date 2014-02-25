module Basic101

  class Arguments

    attr_reader :filenames
    attr_reader :randomize
    attr_reader :transcript

    def initialize(argv)
      @transcript = false
      @randomize = true
      OptionParser.new do |opts|
        opts.banner << " [PATH]..."
        opts.on('-t', '--transcript') do |v|
          @transcript = v
        end
        opts.on('--[no-]randomize') do |v|
          @randomize = v
        end
      end.parse!(argv)
      @filenames = argv.dup
    rescue OptionParser::ParseError => e
      $stderr.puts e
      exit 1
    end

  end

end
