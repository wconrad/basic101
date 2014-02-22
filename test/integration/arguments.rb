module Integration

  class Arguments

    attr_reader :patterns
    attr_reader :train

    def initialize(argv)
      @train = false
      @patterns = []
      OptionParser.new do |opts|
        opts.banner << " [patterns]"
        opts.on('-t', '--train', 'Train tests') do |v|
          @train = v
        end
      end.parse!(argv)
      @patterns = argv
    rescue OptionParser::ParseError => e
      $stderr.puts e
      exit 1
    end

  end

end
