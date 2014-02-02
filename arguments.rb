module Basic

  class Arguments

    def initialize(argv)
      OptionParser.new do |opts|
        opts.banner << " [filenames]"
      end.parse(argv)
    rescue OptionParser::ParseError => e
      $stderr.puts e
      exit 1
    end

  end

end
