# frozen_string_literal: true

module Integration

  class Test

    BASIC_EXTENSION = '.bas'

    def initialize(basic_path)
      @basic_path = basic_path
      create_input
      create_expected_output
      @expected_output = read_expected_output
    end

    def matches_patterns?(patterns)
      return true if patterns.empty?
      path = Pathname.new(@basic_path)
      path = path.relative_path_from(base_path)
      path.to_s =~ Regexp.union(patterns)
    end

    def run
      output_file = OutputFile.new
      output_file.max_lines = options['max_output_lines']
      File.open(input_path, 'r') do |input_file|
        begin
          program = Basic101::Program.load_file(@basic_path)
          runtime = Basic101::Runtime.new(:input_file => input_file,
                                          :output_file => output_file,
                                          :program => program)
          runtime.run
        rescue Error => e
          output_file.puts_unchecked e
        rescue Parslet::ParseFailed => e
          output_file.puts e
        rescue Basic101::Error => e
          output_file.puts e
        rescue Exception => e
          output_file.puts e, e.backtrace
        end
      end
      @output = output_file.string
    end

    def print_progress
      print progress_character
    end

    def print_failure
      return if passed?
      puts
      puts "Failed: #{File.basename(@basic_path)}"
      actual_output_file = Tempfile.new(expected_output_filename)
      actual_output_file.write @output
      actual_output_file.close
      command = [
        'diff',
        '-u',
        expected_output_path,
        actual_output_file.path,
      ].join(' ')
      system(command)
      actual_output_file.unlink
    end

    def train
      File.open(expected_output_path, 'w') do |file|
        file.write @output
      end
    end
    
    def passed?
      @output == @expected_output
    end

    private

    DEFAULT_OPTIONS = {
      'max_output_lines' => 10_000
    }

    def base_path
      Pathname.new(__dir__) + 'tests'
    end

    def progress_character
      if passed?
        '.'
      else
        'F'
      end
    end

    def create_input
      FileUtils.touch(input_path)
    end

    def create_expected_output
      FileUtils.touch(expected_output_path)
    end

    def read_expected_output
      File.read(expected_output_path)
    end

    def expected_output_filename
      File.basename(expected_output_path)
    end

    def input_path
      path_without_extension + '.input'
    end

    def expected_output_path
      path_without_extension + '.output'
    end

    def options_path
      path_without_extension + '.options'
    end

    def options
      if File.exist?(options_path)
        YAML.load_file(options_path)
      else
        DEFAULT_OPTIONS
      end
    end

    def path_without_extension
      @basic_path.chomp('.bas')
    end

  end

end
