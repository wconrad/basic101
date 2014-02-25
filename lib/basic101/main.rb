module Basic101

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
    end

    def run
      program = Program.load(ARGF)
      runtime = Runtime.new(:program => program)
      if @args.transcript
        runtime.transcript = Transcript.make(@args.filenames.first)
      end
      runtime.randomize if @args.randomize
      runtime.run
    rescue Error => e
      puts e
      exit 1
    end

  end

end
