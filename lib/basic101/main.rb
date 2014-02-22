module Basic101

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
    end

    def run
      program = Program.load(ARGF)
      runtime = Runtime.new(:program => program)
      runtime.run
    rescue Error => e
      $stderr.puts e
      exit 1
    end

  end

end
