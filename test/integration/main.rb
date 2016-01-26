# frozen_string_literal: true

module Integration

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
    end

    def run
      tests = load_tests
      tests.each do |test|
        test.run
        test.print_progress
      end
      puts
      if @args.train
        tests.each(&:train)
      else
        tests.each(&:print_failure)
      end
      exit exitcode(tests)
    end

    private

    def load_tests
      glob = File.join(test_dir, '**', '*' + Test::BASIC_EXTENSION)
      Dir[glob].map do |basic_path|
        Test.new(basic_path)
      end.select do |test|
        test.matches_patterns?(@args.patterns)
      end
    end

    def test_dir
      File.expand_path('tests', __dir__)
    end

    def exitcode(tests)
      if tests.all?(&:passed?)
        0
      else
        1
      end
    end

  end

end
