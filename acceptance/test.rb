module Acceptance

  class Test

    BASIC_EXTENSION = '.bas'

    def initialize(basic_path)
      @basic_path = basic_path
      create_expected_output
      @expected_output = read_expected_output
    end

    def matches_patterns?(patterns)
      return true if patterns.empty?
      @basic_path =~ Regexp.union(patterns)
    end

    def run
      output_file = StringIO.new
      program = Basic::Program.new(output_file)
      begin
        File.open(@basic_path, 'r') do |source_file|
          program.load(source_file)
        end
        program.run
        @output = output_file.string
      rescue Parslet::ParseFailed => e
        @output = e.to_s + "\n"
      end
    end

    def print_progress
      print progress_character
    end

    def print_failure
      return if passed?
      puts
      puts "Failed: #{File.basename(@basic_path)}"
      actual_output_file = Tempfile.new(output_filename)
      actual_output_file.write @output
      actual_output_file.close
      command = [
        'diff',
        '-u',
        output_path,
        actual_output_file.path,
      ].join(' ')
      system(command)
      actual_output_file.unlink
    end

    def train
      File.open(output_path, 'w') do |file|
        file.write @output
      end
    end
    
    def passed?
      @output == @expected_output
    end

    private

    def progress_character
      if passed?
        '.'
      else
        'F'
      end
    end

    def create_expected_output
      return if File.exists?(output_path)
      FileUtils.touch(output_path)
    end

    def read_expected_output
      File.read(output_path)
    end

    def output_filename
      File.basename(output_path)
    end

    def output_path
      @basic_path.chomp('.bas') + '.output'
    end

  end

end
