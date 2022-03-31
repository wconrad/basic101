# frozen_string_literal: true

module Basic101

  class Arguments

    attr_reader :filenames
    attr_reader :randomize
    attr_reader :syntax_check_only
    attr_reader :transcript

    def initialize(argv)
      @transcript = false
      @syntax_check_only = false
      @randomize = true
      OptionParser.new do |opts|
        opts.banner << " [PATH]..."
        opts.on('-t', '--transcript',
                'Write transcript of input and output') do |v|
          @transcript = v
        end
        opts.on('--[no-]randomize',
                'Randomize random number generator.',
                'Default is --randomize') do |v|
          @randomize = v
        end
        opts.on('-s', '--syntax', 'Syntax check only') do |v|
          @syntax_check_only = v
        end
      end.parse!(argv)
      @filenames = argv.dup
    rescue OptionParser::ParseError => e
      $stderr.puts e
      exit 1
    end

  end

end
